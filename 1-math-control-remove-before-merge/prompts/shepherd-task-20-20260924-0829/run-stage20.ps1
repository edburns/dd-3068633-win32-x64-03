[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

$repo = 'edburns/dd-3068633-win32-x64-03'
$parentIssue = 1
$logDirectory = 'C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829'
$ledgerPath = Join-Path $logDirectory 'creation-ledger.json'
$resultPath = Join-Path $logDirectory 'stage-20-result.json'
$verifier = 'C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1'
$selectedIssueType = $null
$tasks = @(
    [pscustomobject]@{
        implementationSubsection = '1. Implement Fibonacci with unit and isolated CLI coverage'
        bodyFile = 'issue-bodies\01-1-implement-fibonacci-body.md'
        title = '1. Implement Fibonacci with unit and isolated CLI coverage'
    },
    [pscustomobject]@{
        implementationSubsection = '2. Add factorial and operation dispatch'
        bodyFile = 'issue-bodies\02-2-add-factorial-dispatch-body.md'
        title = '2. Add factorial and operation dispatch'
    }
)

function Write-AtomicText {
    param(
        [Parameter(Mandatory)][string]$Path,
        [Parameter(Mandatory)][AllowEmptyString()][string]$Content
    )

    $temporaryPath = "$Path.$([guid]::NewGuid().ToString('N')).tmp"
    try {
        [IO.File]::WriteAllText($temporaryPath, $Content, [Text.UTF8Encoding]::new($false))
        Move-Item -LiteralPath $temporaryPath -Destination $Path -Force
    }
    finally {
        if (Test-Path -LiteralPath $temporaryPath) {
            Remove-Item -LiteralPath $temporaryPath -Force
        }
    }
}

function Write-Result {
    param(
        [Parameter(Mandatory)][ValidateSet('in_progress', 'complete', 'failed')][string]$Status,
        [AllowNull()][object]$OperationError
    )

    $result = [ordered]@{
        schemaVersion = 1
        status = $Status
        ledgerFile = 'creation-ledger.json'
        operationError = $OperationError
    }
    Write-AtomicText -Path $resultPath -Content ($result | ConvertTo-Json -Depth 4)
}

function Read-CreationLedger {
    $parsed = [IO.File]::ReadAllText($ledgerPath) |
        ConvertFrom-Json -NoEnumerate
    if ($parsed -isnot [System.Array]) {
        throw 'Creation ledger JSON root must be an array.'
    }

    $ledger = [object[]]$parsed
    if (@($ledger | Where-Object { $_ -is [System.Array] }).Count -ne 0) {
        throw 'Creation ledger must not contain nested array entries.'
    }
    return $ledger
}

function Write-CreationLedger {
    param([Parameter(Mandatory)][AllowEmptyCollection()][object[]]$Ledger)

    $json = ConvertTo-Json -InputObject ([object[]]$Ledger) -Depth 10
    Write-AtomicText -Path $ledgerPath -Content $json
}

function Update-LedgerFlag {
    param(
        [Parameter(Mandatory)][int]$Number,
        [Parameter(Mandatory)][ValidateSet('body_verified', 'linked')][string]$Field,
        [Parameter(Mandatory)][bool]$Value
    )

    $ledger = @(Read-CreationLedger)
    $entry = @($ledger | Where-Object { $_.number -eq $Number })
    if ($entry.Count -ne 1) {
        throw "Expected exactly one ledger entry for issue #$Number."
    }
    $entry[0].$Field = $Value
    Write-CreationLedger -Ledger $ledger
}

function Get-NormalizedChildren {
    $childrenOutput = & gh api "repos/$repo/issues/$parentIssue/sub_issues" --paginate --slurp 2>&1
    $childrenExitCode = $LASTEXITCODE
    if ($childrenExitCode -ne 0) {
        throw "Unable to query parent children: $($childrenOutput | Out-String)"
    }

    $completeJson = $childrenOutput | Out-String
    $normalizedJson = $completeJson |
        jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end'
    $jqExitCode = $LASTEXITCODE
    if ($jqExitCode -ne 0) {
        throw 'Unable to normalize the paginated child response.'
    }

    $children = @(($normalizedJson | Out-String) | ConvertFrom-Json)
    if (@($children | Where-Object { $_ -is [System.Array] }).Count -ne 0) {
        throw 'Normalized child response contains a nested array.'
    }
    return $children
}

function Reconcile-Failure {
    param([Parameter(Mandatory)][string]$OperationError)

    try {
        $serverChildren = @(Get-NormalizedChildren)
        $childIds = @($serverChildren | ForEach-Object { [long]$_.id })
        $ledger = @(Read-CreationLedger)
        foreach ($entry in $ledger) {
            $issueOutput = & gh api "repos/$repo/issues/$($entry.number)" 2>&1
            $issueExitCode = $LASTEXITCODE
            if ($issueExitCode -ne 0) {
                $OperationError += " Reconciliation lookup for issue #$($entry.number) failed: $($issueOutput | Out-String)"
            }
            $entry.linked = $childIds -contains [long]$entry.id
        }
        Write-CreationLedger -Ledger $ledger
    }
    catch {
        $OperationError += " Reconciliation failed: $($_.Exception.Message)"
    }

    Write-Result -Status failed -OperationError $OperationError
    $reconciled = @(Read-CreationLedger)
    if ($reconciled.Count -eq 0) {
        Write-Output 'No issues were created; no cleanup is required.'
        return
    }

    Write-Output ($reconciled |
        Select-Object number, title, url, bodyFile, body_verified, linked |
        Format-Table -AutoSize |
        Out-String)
    foreach ($entry in $reconciled) {
        Write-Output "gh issue delete $($entry.number) --repo `"$repo`" --yes"
    }
    Write-Output 'The operation did not complete. No automatic rollback was performed. Delete every issue in the ledger before invoking stage 20 again.'
}

$baseline = @()
try {
    $baseline = @(Get-NormalizedChildren)
    Write-CreationLedger -Ledger ([object[]]@())
    Write-Result -Status in_progress -OperationError $null

    foreach ($task in $tasks) {
        $bodyPath = Join-Path $logDirectory $task.bodyFile
        $createArguments = @(
            'api',
            "repos/$repo/issues",
            '-X', 'POST',
            '-f', "title=$($task.title)",
            '-F', "body=@$bodyPath"
        )
        if ($selectedIssueType) {
            $createArguments += @('-f', "type=$selectedIssueType")
        }

        $createOutput = & gh @createArguments 2>&1
        $createExitCode = $LASTEXITCODE
        if ($createExitCode -ne 0) {
            throw "Create failed for '$($task.implementationSubsection)': $($createOutput | Out-String)"
        }
        $created = ($createOutput | Out-String) | ConvertFrom-Json

        $ledger = @(Read-CreationLedger)
        $ledger += [pscustomobject][ordered]@{
            implementationSubsection = $task.implementationSubsection
            bodyFile = $task.bodyFile
            id = [long]$created.id
            number = [int]$created.number
            title = [string]$created.title
            url = [string]$created.html_url
            body_verified = $false
            linked = $false
        }
        Write-CreationLedger -Ledger $ledger

        $null = & $verifier `
            -Repository $repo `
            -IssueNumber ([int]$created.number) `
            -ExpectedBodyPath $bodyPath `
            -MaxAttempts 6 `
            -DelaySeconds 5 `
            -DiagnosticPath (Join-Path $logDirectory "issue-$($created.number)-body-verification-failure.json")
        Update-LedgerFlag -Number ([int]$created.number) -Field body_verified -Value $true

        $payloadPath = Join-Path $logDirectory "issue-$($created.number)-link-payload.json"
        try {
            Write-AtomicText -Path $payloadPath -Content (@{ sub_issue_id = [long]$created.id } | ConvertTo-Json -Compress)
            $linked = $false
            $lastLinkError = ''
            for ($attempt = 1; $attempt -le 3; $attempt++) {
                $linkOutput = & gh api "repos/$repo/issues/$parentIssue/sub_issues" -X POST --input $payloadPath 2>&1
                $linkExitCode = $LASTEXITCODE
                if ($linkExitCode -eq 0) {
                    $linked = $true
                    break
                }
                $lastLinkError = $linkOutput | Out-String
                if ($attempt -lt 3) {
                    Start-Sleep -Seconds 2
                }
            }
            if (-not $linked) {
                throw "Link failed for issue #$($created.number) after 3 attempts: $lastLinkError"
            }
        }
        finally {
            if (Test-Path -LiteralPath $payloadPath) {
                Remove-Item -LiteralPath $payloadPath -Force
            }
        }
        Update-LedgerFlag -Number ([int]$created.number) -Field linked -Value $true
    }

    $ledger = @(Read-CreationLedger)
    $finalChildren = @(Get-NormalizedChildren)
    if ($finalChildren.Count -ne $baseline.Count + $ledger.Count) {
        throw "Final child count $($finalChildren.Count) did not equal baseline $($baseline.Count) plus ledger $($ledger.Count)."
    }

    $baselineIds = @($baseline | ForEach-Object { [long]$_.id })
    $newChildren = @($finalChildren | Where-Object { $baselineIds -notcontains [long]$_.id })
    if ($newChildren.Count -ne $ledger.Count) {
        throw 'The set of newly linked children does not match the creation ledger count.'
    }
    for ($index = 0; $index -lt $ledger.Count; $index++) {
        $matches = @($finalChildren | Where-Object { [long]$_.id -eq [long]$ledger[$index].id })
        if ($matches.Count -ne 1) {
            throw "Issue #$($ledger[$index].number) is not linked exactly once."
        }
        if ([long]$newChildren[$index].id -ne [long]$ledger[$index].id) {
            throw 'New child order does not match implementation plan order.'
        }

        $bodyPath = Join-Path $logDirectory $ledger[$index].bodyFile
        $issue = & $verifier `
            -Repository $repo `
            -IssueNumber ([int]$ledger[$index].number) `
            -ExpectedBodyPath $bodyPath `
            -MaxAttempts 6 `
            -DelaySeconds 5 `
            -DiagnosticPath (Join-Path $logDirectory "issue-$($ledger[$index].number)-body-verification-failure.json")
        if ($issue.state -ne 'open') {
            throw "Issue #$($ledger[$index].number) is not open."
        }
        if (@($issue.assignees).Count -ne 0) {
            throw "Issue #$($ledger[$index].number) is assigned."
        }
        if ($selectedIssueType -and $issue.type.name -ne $selectedIssueType) {
            throw "Issue #$($ledger[$index].number) does not have type $selectedIssueType."
        }
    }

    Write-Result -Status complete -OperationError $null
    Write-Output ($ledger | ConvertTo-Json -Depth 10)
}
catch {
    $message = $_.Exception.Message
    Reconcile-Failure -OperationError $message
    throw $message
}
