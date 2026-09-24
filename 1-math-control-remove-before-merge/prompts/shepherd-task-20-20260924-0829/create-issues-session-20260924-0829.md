# Copilot CLI Session

> [!NOTE]
> - **Session ID:** `87badcd6-7efe-42e7-bc64-a3c85f4bb965`  
> - **Started:** 9/24/2026, 8:29:38 AM  
> - **Duration:** 2m 59s  
> - **Exported:** 9/24/2026, 8:32:37 AM  

---

<sub>10s</sub>

### User

Invoke skill `shepherd-task-20-create-issues-from-plan` with these inputs:

- CAMPAIGN_ID: 7a12d451-5fe1-4901-b11c-f7481c756a99
- LESSON_PROPAGATION: off
- REPO: edburns/dd-3068633-win32-x64-03
- BASE_BRANCH: experiment/shepherd-control
- PARENT_ISSUE: 1
- PLAN_DIRECTORY: 1-math-control-remove-before-merge
- PLAN_FILE_NAME: math-tool-ignorance-reduction-plan.md
- QUESTIONS_SECTION: ## Ignorance reduction
- IMPLEMENTATION_SECTION: ## Implementation
- EXPECTED_TASK_COUNT: 2
- BASE_REMOTE: origin
- LOG_DIRECTORY: C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829
- DRAFT_VALIDATOR: C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1
- ISSUE_BODY_VERIFIER: C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1

Fixture pagination response contract (mandatory):

- `gh api ... --paginate --slurp` returns a JSON array of page payloads, so a
  one-page response has the shape `[[{...}]]`, not `[{...}]`.
- Before indexing child issue fields such as `.id`, normalize the response to
  one flat issue array exactly once.
- In Bash, use:
  `jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end'`.
- In PowerShell, capture the `gh` output and `$LASTEXITCODE` first, then pass
  the complete JSON through the same `jq` normalization before
  `ConvertFrom-Json`.
- Use the normalized flat array for the pre-creation baseline, final child
  count/order checks, and failure reconciliation. Do not apply `add` a second
  time to an already-flat array.


---

<sub>14s</sub>

### `skill`

**shepherd-task-20-create-issues-from-plan**

<details>
<summary>Arguments</summary>

```json
{
  "skill": "shepherd-task-20-create-issues-from-plan"
}
```

</details>

```
Skill "shepherd-task-20-create-issues-from-plan" loaded successfully. Follow the instructions in the skill context.
```


---

<sub>17s</sub>

### Copilot

I’m validating the campaign manifest, plan structure, repository/branch, parent issue, and issue-type support before drafting any GitHub mutations.

---

<sub>38s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\01-1682-java-tool-ergonomics.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\01-1682-java-tool-ergonomics.md

<details>
<summary>15 lines</summary>

```
# Example 01: 1682-java-tool-ergonomics-prompts-remove-before-merge

Read `copilot-sdk/1682-java-tool-ergonomics-prompts-remove-before-merge/dd-3018003-ignorance-reduction-for-implementation-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 3 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating issues of type **Task** as children of Epic https://github.com/github/copilot-sdk/issues/1682 . These issues correspond to the sub-sections in `## Phase 4 — Implementation (the build order)`.

I want you to use `gh` to create issues as sub-issues of 1682.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Set the type to **Task**.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `upstream`: `edburns/1682-java-tool-ergonomics`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `1682-java-tool-ergonomics-prompts-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>37s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\02-1810-java-tool-as-lambda.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\02-1810-java-tool-as-lambda.md

<details>
<summary>12 lines</summary>

```
# Example 02: 1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge

Carefully read the plan `copilot-sdk/1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`.

We have completed Phases 1 - 3. We are now on Phase 4.

For each sub item in Phase 4, file a child issue of Feature #1810.

Use `gh` to look at Epic #1682 and its child issues for the standard of verbosity and concreteness for issue descriptions.

The issue should be assignable to a coding agent and there must be sufficient detail in the description for the agent to proceed to completion.

Pull out the specific relevant content from Phase 3 as it applies to this current issue in Phase 4.

Tell the agent to take `edburns/1810-java-tool-ergonomics-tool-as-lambda` as the base branch. When I assign the issue to the coding agent, I will set this as the base branch.

Tell the agent to read `1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`, which is present on the branch, for context.

Tell the agent which sub-item within Phase 4 they are solving.

Tell the agent that each issue will be assigned, resolved and merged to the base branch in the order in which they appear in the plan.

No work is to start until I assign each issue to the coding agent, in turn.
```

</details>


---

<sub>39s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\03-dd-3017826-java-real-estate-demo.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\03-dd-3017826-java-real-estate-demo.md

<details>
<summary>14 lines</summary>

```
# Example 03: dd-3017826-java-real-estate-demo-remove-before-merge

Read `dd-3017826-java-real-estate-demo-remove-before-merge\dd-3017826-java-real-estate-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/2 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #2.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/2-build-out-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `dd-3017826-java-real-estate-demo-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>39s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\04-28-python-agent-demo.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\04-28-python-agent-demo.md

<details>
<summary>16 lines</summary>

```
# Example 04: 28-python-agent-demo-remove-before-merge

Read `28-python-agent-demo-remove-before-merge/28-python-agent-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`. These pertain to the implementation tasks in Phase 3. ✅✅✅ Include relevant spike findings as self-contained prose in the issue description; do not direct the agent to spike directories or source files.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/28 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #28

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Again, ✅✅For each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`, include the relevant Resolution values in the issue description. These pertain to the implementation tasks in Phase 3. ✅✅✅ State relevant spike findings directly in the issue body with enough detail to implement them without reading spike code.

- For tasks dealing with the UI, make sure to refer to the relevant screengrabs, but only ones within `28-python-agent-demo-remove-before-merge/`.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/28-python-agent-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `28-python-agent-demo-remove-before-merge/`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>40s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\shepherd-task-component.json.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\shepherd-task-component.json

<details>
<summary>5 lines</summary>

```
{
  "schemaVersion": 1,
  "shepherdTaskVersion": "1.0.4",
  "component": "shepherd-task-20-create-issues-from-plan"
}
```

</details>


---

<sub>41s</sub>

### `powershell`

**Validate stage 20 local paths**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $logDir='C:\\Users\\edburns\\workareas\\dd-3068633-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260924-0829'; $validator='C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\validate-stage20-drafts.ps1'; $verifier='C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-github-issue-body.ps1'; [pscustomobject]@{LogDirectoryExists=(Test-Path -LiteralPath $logDir -PathType Container); ValidatorExists=(Test-Path -LiteralPath $validator -PathType Leaf); VerifierExists=(Test-Path -LiteralPath $verifier -PathType Leaf); LogDirectoryRooted=[IO.Path]::IsPathRooted($logDir); ValidatorRooted=[IO.Path]::IsPathRooted($validator); VerifierRooted=[IO.Path]::IsPathRooted($verifier)} | ConvertTo-Json; New-Item -ItemType Directory -Path (Join-Path $logDir 'issue-bodies') -Force | Out-Null; $probe=Join-Path $logDir '.write-probe'; [IO.File]::WriteAllText($probe,'ok'); Remove-Item -LiteralPath $probe",
  "description": "Validate stage 20 local paths"
}
```

</details>

<details>
<summary>9 lines</summary>

```
{
  "LogDirectoryExists": true,
  "ValidatorExists": true,
  "VerifierExists": true,
  "LogDirectoryRooted": true,
  "ValidatorRooted": true,
  "VerifierRooted": true
}
<shellId: 0 completed with exit code 0>
```

</details>


---

<sub>41s</sub>

### `powershell`

**Read branch plan and campaign files**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; git --no-pager remote -v; git --no-pager branch --list 'experiment/shepherd-control'; git --no-pager show 'experiment/shepherd-control:1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md'; git --no-pager show 'experiment/shepherd-control:1-math-control-remove-before-merge/shepherd-campaign.json'; git --no-pager cat-file -e 'experiment/shepherd-control:1-math-control-remove-before-merge/campaign-lessons.md'; if ($LASTEXITCODE -ne 0) { throw 'Required branch content lookup failed.' }",
  "description": "Read branch plan and campaign files"
}
```

</details>

<details>
<summary>58 lines</summary>

```
origin	git@github.com:edburns/dd-3068633-win32-x64-03.git (fetch)
origin	git@github.com:edburns/dd-3068633-win32-x64-03.git (push)
* experiment/shepherd-control
# PowerShell math-tool control campaign

Build the fixture in two cheap, serial tasks. The repository already contains
deterministic CI pinned to Pester 5.7.1. The acceptance command for every task
is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. Task 2 starts only after task 1 is merged.

## Ignorance reduction

### Repository-owned validation

**Question:** What command and environment define acceptance?

**Resolution:** The committed canonical command is
`pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The baseline workflow
`.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester
5.7.1 and invokes that repository-owned runner. Do not replace or bypass it.

### Output and ordering contracts

**Question:** What externally observable behavior and dependency order are required?

**Resolution:** Direct CLI execution writes exactly one result line to stdout:
`Fibonacci(N) = value` or `Factorial(N) = value`. Functions return the
numeric value without incidental output. Inputs are non-negative integers.
Implementation is serial: task 2 depends on merged task 1. The implementation
and test files are repository-root `math-tool.ps1` and
`math-tool.Tests.ps1`.

## Implementation

### 1. Implement Fibonacci with unit and isolated CLI coverage

Create `math-tool.ps1` with parameter `N` and a pure `Get-Fibonacci`
function. Direct execution must print exactly `Fibonacci(N) = value`.
Create `math-tool.Tests.ps1` containing dot-sourced unit tests for the
function and isolated child-`pwsh` process tests for direct CLI behavior.
Cover N=0, N=1, and a small representative value. Keep changes limited to the
math tool and its tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero and the pinned pull-request CI
passes.

### 2. Add factorial and operation dispatch

After task 1 is merged, extend the same script with a pure `Get-Factorial`
function and an `Operation` parameter that dispatches between `fibonacci`
and `factorial` while retaining `N`. Preserve Fibonacci behavior. Cover
factorial edge cases 0 and 1 plus a small representative value. Keep the
interface and tests objective and small; the issue does not prescribe how to
extend the tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined regression suite
and the pinned pull-request CI passes.
{
  "schemaVersion": 1,
  "campaignId": "7a12d451-5fe1-4901-b11c-f7481c756a99",
  "campaignIssueNumber": 1,
  "campaignShortname": "math-control",
  "repository": "edburns/dd-3068633-win32-x64-03",
  "baseBranch": "experiment/shepherd-control",
  "lessonPropagation": "off",
  "campaignMetadataDirectory": "1-math-control-remove-before-merge",
  "lessonsFile": "campaign-lessons.md",
  "createdBy": {
    "shepherdTaskVersion": "1.0.4",
    "stageOutcomeProtocolVersion": 1
  },
  "createdAt": "2026-09-24T12:29:31Z"
}
<shellId: 3 completed with exit code 0>
```

</details>


---

<sub>43s</sub>

### `powershell`

**Validate GitHub repository metadata**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $repo='edburns/dd-3068633-win32-x64-03'; $repoOut=& gh api \"repos/$repo\" 2>&1; $repoCode=$LASTEXITCODE; if($repoCode -ne 0){throw \"Repository lookup failed: $($repoOut|Out-String)\"}; $repoObj=($repoOut|Out-String|ConvertFrom-Json); $parentOut=& gh api \"repos/$repo/issues/1\" 2>&1; $parentCode=$LASTEXITCODE; if($parentCode -ne 0){throw \"Parent lookup failed: $($parentOut|Out-String)\"}; $parentObj=($parentOut|Out-String|ConvertFrom-Json); $types=$null; if($repoObj.owner.type -eq 'Organization'){ $typesOut=& gh api \"orgs/$($repoObj.owner.login)/issue-types\" 2>&1; $typesCode=$LASTEXITCODE; if($typesCode -ne 0){throw \"Issue types lookup failed: $($typesOut|Out-String)\"}; $types=($typesOut|Out-String|ConvertFrom-Json) } elseif($repoObj.owner.type -ne 'User'){throw \"Unrecognized owner type $($repoObj.owner.type)\"}; [pscustomobject]@{default_branch=$repoObj.default_branch; owner_login=$repoObj.owner.login; owner_type=$repoObj.owner.type; parent_number=$parentObj.number; parent_state=$parentObj.state; parent_url=$parentObj.html_url; selected_issue_type=if($types){@($types|Where-Object {$_.name -eq 'Task' -and $_.is_enabled -eq $true}|Select-Object -First 1).name}else{$null}} | ConvertTo-Json -Depth 5",
  "description": "Validate GitHub repository metadata"
}
```

</details>

<details>
<summary>10 lines</summary>

```
{
  "default_branch": "main",
  "owner_login": "edburns",
  "owner_type": "User",
  "parent_number": 1,
  "parent_state": "open",
  "parent_url": "https://github.com/edburns/dd-3068633-win32-x64-03/issues/1",
  "selected_issue_type": null
}
<shellId: 1 completed with exit code 0>
```

</details>


---

<sub>42s</sub>

### `powershell`

**Capture normalized child baseline**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $repo='edburns/dd-3068633-win32-x64-03'; $raw=& gh api \"repos/$repo/issues/1/sub_issues\" --paginate --slurp 2>&1; $code=$LASTEXITCODE; if($code -ne 0){throw \"Child lookup failed: $($raw|Out-String)\"}; $complete=$raw|Out-String; $normalized=$complete | jq 'if length == 0 then [] elif all(.[]; type == \"array\") then add else . end'; $jqCode=$LASTEXITCODE; if($jqCode -ne 0){throw 'Child response normalization failed.'}; $children=@($normalized|ConvertFrom-Json); $children | Select-Object id,number,title,html_url | ConvertTo-Json -Depth 4",
  "description": "Capture normalized child baseline"
}
```

</details>

```

<shellId: 2 completed with exit code 0>
```


---

<sub>45s</sub>

### Copilot

Validation passed: the topic branch is non-default, parent #1 is open, the manifest matches the campaign inputs, both decisions are resolved, and this user-owned repository will create ordinary untyped issues. I’m now drafting the two serial task specifications and checking the validator’s exact persisted-body contract.

---

<sub>56s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1.**

C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1

<details>
<summary>60 lines</summary>

```
# shepherd-task-version: 1.0.4
<#
.SYNOPSIS
    Validates persisted stage-20 issue bodies before GitHub mutation.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$BodyDirectory,

    [Parameter(Mandatory)]
    [ValidateRange(1, [int]::MaxValue)]
    [int]$ExpectedCount,

    [Parameter(Mandatory)]
    [ValidateSet('off', 'campaign')]
    [string]$LessonPropagation
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $BodyDirectory -PathType Container)) {
    throw "Stage-20 body directory does not exist: $BodyDirectory"
}

$bodyFiles = @(
    Get-ChildItem -LiteralPath $BodyDirectory -Filter '*-body.md' -File |
        Where-Object { $_.Name -notlike '*-observed-body.md' } |
        Sort-Object Name
)
if ($bodyFiles.Count -ne $ExpectedCount) {
    throw "Expected $ExpectedCount persisted stage-20 body files; found $($bodyFiles.Count)."
}

$requiredHeadings = @(
    '## Campaign context and required reading',
    '## Branch and execution order',
    '## Implement',
    '## Completion gates',
    '## Out of scope'
)

foreach ($bodyFile in $bodyFiles) {
    $text = [System.IO.File]::ReadAllText($bodyFile.FullName)
    $lines = [System.IO.File]::ReadAllLines($bodyFile.FullName)
    if ([string]::IsNullOrWhiteSpace($text) -or $text -notmatch "`r?`n" -or $lines.Count -le 1) {
        throw "Persisted issue body must contain physical Markdown lines: $($bodyFile.FullName)"
    }

    $firstNonblank = $lines | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Select-Object -First 1
    if ($firstNonblank -notmatch '^##\s+\S') {
        throw "Persisted issue body must begin with a level-two heading: $($bodyFile.FullName)"
    }

    foreach ($heading in $requiredHeadings) {
        if ($lines -cnotcontains $heading) {
            throw "Persisted issue body is missing the physical heading '$heading': $($bodyFile.FullName)"
        }
    }

    $hasCampaignLessons = $lines -ccontains '## Campaign lessons (REQUIRED)'
    if ($LessonPropagation -eq 'campaign' -and -not $hasCampaignLessons) {
        throw "Treatment issue body is missing its campaign-lessons heading: $($bodyFile.FullName)"
    }
    if ($LessonPropagation -eq 'off' -and $hasCampaignLessons) {
        throw "Control issue body unexpectedly contains a campaign-lessons heading: $($bodyFile.FullName)"
    }
}

$bodyFiles
```

</details>


---

<sub>57s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1.**

C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1

<details>
<summary>166 lines</summary>

```
# shepherd-task-version: 1.0.4
<#
.SYNOPSIS
    Fetches a GitHub issue through REST and verifies its body against a file.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidatePattern('^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$')]
    [string]$Repository,

    [Parameter(Mandatory)]
    [ValidateRange(1, [int]::MaxValue)]
    [int]$IssueNumber,

    [Parameter(Mandatory)]
    [string]$ExpectedBodyPath,

    [ValidateRange(1, 100)]
    [int]$MaxAttempts = 6,

    [ValidateRange(0, 300)]
    [int]$DelaySeconds = 5,

    [string]$DiagnosticPath,

    [string]$GitHubCli = 'gh'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

function ConvertTo-NormalizedLineEndings {
    param([AllowEmptyString()][string]$Text)
    return $Text -replace "`r`n|`r", "`n"
}

function Test-EquivalentBody {
    param(
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    if ($Actual -ceq $Expected) {
        return $true
    }
    if ($Actual.EndsWith("`n") -and $Actual.Substring(0, $Actual.Length - 1) -ceq $Expected) {
        return $true
    }
    if ($Expected.EndsWith("`n") -and $Expected.Substring(0, $Expected.Length - 1) -ceq $Actual) {
        return $true
    }
    return $false
}

function Get-Sha256 {
    param([AllowEmptyString()][string]$Text)

    $bytes = [System.Text.UTF8Encoding]::new($false).GetBytes($Text)
    return [Convert]::ToHexString([System.Security.Cryptography.SHA256]::HashData($bytes)).ToLowerInvariant()
}

function Get-FirstDifference {
    param(
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    $limit = [Math]::Min($Actual.Length, $Expected.Length)
    $offset = 0
    while ($offset -lt $limit -and $Actual[$offset] -ceq $Expected[$offset]) {
        $offset++
    }
    if ($offset -eq $limit -and $Actual.Length -eq $Expected.Length) {
        return $null
    }

    $prefix = $Expected.Substring(0, [Math]::Min($offset, $Expected.Length))
    $line = ([regex]::Matches($prefix, "`n").Count) + 1
    $lastNewline = $prefix.LastIndexOf("`n", [StringComparison]::Ordinal)
    $column = if ($lastNewline -lt 0) { $offset + 1 } else { $offset - $lastNewline }
    return [ordered]@{
        offset = $offset
        line = $line
        column = $column
    }
}

function Test-TerminalGitHubFailure {
    param([string]$Message)
    return $Message -match '(?i)(HTTP\s+(401|403)|authentication|not authorized|resource not accessible)'
}

function Write-Diagnostic {
    param(
        [string]$Reason,
        [int]$Attempts,
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    if ([string]::IsNullOrWhiteSpace($DiagnosticPath)) {
        return
    }

    $parent = Split-Path -Parent $DiagnosticPath
    if (-not [string]::IsNullOrWhiteSpace($parent) -and
        -not (Test-Path -LiteralPath $parent -PathType Container)) {
        New-Item -ItemType Directory -Path $parent | Out-Null
    }

    $diagnostic = [ordered]@{
        schemaVersion = 1
        repository = $Repository
        issueNumber = $IssueNumber
        endpoint = "repos/$Repository/issues/$IssueNumber"
        attempts = $Attempts
        observedAt = (Get-Date).ToUniversalTime().ToString('o')
        reason = $Reason
        expectedLength = $Expected.Length
        actualLength = $Actual.Length
        expectedSha256 = Get-Sha256 $Expected
        actualSha256 = Get-Sha256 $Actual
        firstDifference = Get-FirstDifference -Actual $Actual -Expected $Expected
    }
    $diagnostic | ConvertTo-Json -Depth 4 |
        Set-Content -LiteralPath $DiagnosticPath -Encoding utf8NoBOM
}

if (-not (Test-Path -LiteralPath $ExpectedBodyPath -PathType Leaf)) {
    throw "Expected issue body file not found: $ExpectedBodyPath"
}

$expected = ConvertTo-NormalizedLineEndings (
    Get-Content -LiteralPath $ExpectedBodyPath -Raw
)
$lastReason = ''
$lastActual = ''
$previousConsoleOutputEncoding = [Console]::OutputEncoding
$previousOutputEncoding = $OutputEncoding
$utf8Encoding = [System.Text.UTF8Encoding]::new($false)

try {
    [Console]::OutputEncoding = $utf8Encoding
    $OutputEncoding = $utf8Encoding

    for ($attempt = 1; $attempt -le $MaxAttempts; $attempt++) {
        $output = (& $GitHubCli api "repos/$Repository/issues/$IssueNumber" 2>&1 | Out-String).Trim()
        $exitCode = $LASTEXITCODE
        if ($exitCode -ne 0) {
            $lastReason = "GitHub REST request failed with exit code $exitCode."
            if (Test-TerminalGitHubFailure $output) {
                Write-Diagnostic -Reason $lastReason -Attempts $attempt -Actual '' -Expected $expected
                throw "Unable to fetch issue #$IssueNumber from ${Repository}: $output"
            }
        }
        else {
            try {
                $issue = $output | ConvertFrom-Json
                $lastActual = ConvertTo-NormalizedLineEndings ([string]$issue.body)
                if (Test-EquivalentBody -Actual $lastActual -Expected $expected) {
                    return $issue
                }
                $lastReason = 'GitHub issue body differs from the persisted draft.'
            }
            catch {
                $lastReason = "GitHub REST response was invalid JSON: $($_.Exception.Message)"
            }
        }

        if ($attempt -lt $MaxAttempts) {
            Write-Warning "$lastReason Retrying issue #$IssueNumber body verification ($attempt/$MaxAttempts)."
            if ($DelaySeconds -gt 0) {
                Start-Sleep -Seconds $DelaySeconds
            }
        }
    }

    Write-Diagnostic -Reason $lastReason -Attempts $MaxAttempts -Actual $lastActual -Expected $expected
    $diagnosticSuffix = if ([string]::IsNullOrWhiteSpace($DiagnosticPath)) {
        ''
    }
    else {
        " Diagnostic: $DiagnosticPath"
    }
    throw "Issue #$IssueNumber body verification failed after $MaxAttempts attempts. $lastReason$diagnosticSuffix"
}
finally {
    $OutputEncoding = $previousOutputEncoding
    [Console]::OutputEncoding = $previousConsoleOutputEncoding
}
```

</details>


---

<sub>58s</sub>

### `powershell`

**List campaign supporting resources**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; git --no-pager ls-tree -r --name-only 'experiment/shepherd-control' -- '1-math-control-remove-before-merge'; if($LASTEXITCODE -ne 0){throw 'Unable to list campaign resources.'}",
  "description": "List campaign supporting resources"
}
```

</details>

```
1-math-control-remove-before-merge/campaign-lessons.md
1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md
1-math-control-remove-before-merge/shepherd-campaign.json
1-math-control-remove-before-merge/shepherd-test-experiment.json
<shellId: 5 completed with exit code 0>
```


---

<sub>58s</sub>

### `powershell`

**Verify base remote and branch**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $remoteUrl=(git remote get-url origin); if($LASTEXITCODE -ne 0){throw 'Unable to read origin URL.'}; $branchRemote=(git ls-remote --heads origin 'refs/heads/experiment/shepherd-control'); if($LASTEXITCODE -ne 0){throw 'Unable to query base branch on origin.'}; [pscustomobject]@{remote_url=$remoteUrl; remote_branch_exists=([bool]$branchRemote)} | ConvertTo-Json",
  "description": "Verify base remote and branch"
}
```

</details>

```
{
  "remote_url": "git@github.com:edburns/dd-3068633-win32-x64-03.git",
  "remote_branch_exists": true
}
<shellId: 4 completed with exit code 0>
```


---

<sub>1m 27s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-0829/issue-bodies/01-1-implement-fibonacci-body.md\n+## Campaign context and required reading\n+\n+**On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.**\n+\n+Read the entire plan before working. Then re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+\n+Apply these resolved decisions:\n+\n+- Repository acceptance is defined by `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and invokes that repository-owned runner; do not replace or bypass either contract.\n+- Direct CLI execution writes exactly one result line to stdout in the form `Fibonacci(N) = value`.\n+- Functions return their numeric value without incidental output.\n+- Inputs are non-negative integers.\n+- The production and test files are repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.\n+- Research produced no additional spike-specific implementation pattern. Implement from the plan's resolved contracts and repository conventions; do not copy or adapt research artifact code.\n+\n+## Branch and execution order\n+\n+Target `experiment/shepherd-control` as the PR base branch. This is task 1 of 2. The tasks are assigned, completed, and merged serially in plan order. Do not start until this issue is assigned. Task 2 starts only after this task is merged.\n+\n+Keep the issue unassigned until the campaign owner dispatches it. Make only the changes required by this task on a branch based on the latest `experiment/shepherd-control`.\n+\n+## Implement\n+\n+Create repository-root `math-tool.ps1` with:\n+\n+- A script parameter named `N` accepting non-negative integer input.\n+- A pure `Get-Fibonacci` function that returns the numeric Fibonacci value and emits no incidental output.\n+- Direct-execution behavior that calls the function and writes exactly one stdout line: `Fibonacci(N) = value`.\n+- Correct behavior for `N=0`, `N=1`, and representative positive values.\n+\n+Create repository-root `math-tool.Tests.ps1` with:\n+\n+- Dot-sourced Pester unit tests for `Get-Fibonacci`.\n+- Isolated child-`pwsh` process tests for direct CLI behavior, so CLI output assertions do not depend on the test process's loaded script state.\n+- Coverage for `N=0`, `N=1`, and at least one small representative positive value at both the function and CLI contract levels where appropriate.\n+- Assertions that discriminate the numeric function return from formatted CLI output and ensure direct execution produces exactly one expected result line.\n+\n+Follow existing PowerShell and Pester conventions in the repository. Keep the implementation objective and small.\n+\n+## Completion gates\n+\n+- Run `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`; it must exit zero using the pinned Pester 5.7.1 setup.\n+- Confirm `Get-Fibonacci` returns numeric values for 0, 1, and the representative input without extra pipeline output.\n+- Confirm each isolated CLI invocation exits zero and stdout is exactly one line matching `Fibonacci(N) = value`, with no headings, diagnostics, blank result lines, or test-process leakage.\n+- Confirm the test runner discovers and executes `math-tool.Tests.ps1`.\n+- Confirm the pull-request workflow `.github/workflows/shepherd-task-math-tool.yml` passes without changing its pinned Pester version or bypassing the repository-owned runner.\n+\n+## Out of scope\n+\n+- Do not add factorial, operation dispatch, or an `Operation` parameter; those belong to task 2.\n+- Do not change the canonical test runner or CI workflow.\n+- Do not add dependencies or broaden the accepted input domain beyond non-negative integers.\n+- Do not modify files other than `math-tool.ps1` and `math-tool.Tests.ps1` unless a repository-required formatting artifact is unavoidable.\n+- Do not read, copy, adapt, or promote spike source code into production or production tests.\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-0829/issue-bodies/02-2-add-factorial-dispatch-body.md\n+## Campaign context and required reading\n+\n+**On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.**\n+\n+Read the entire plan before working. Then re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+- `### 2. Add factorial and operation dispatch`\n+\n+Apply these resolved decisions:\n+\n+- Repository acceptance is defined by `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and invokes that repository-owned runner; do not replace or bypass either contract.\n+- Direct CLI execution writes exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`, selected by the requested operation.\n+- Both functions return numeric values without incidental output.\n+- Inputs are non-negative integers.\n+- This task depends on merged task 1 and extends the repository-root `math-tool.ps1` and `math-tool.Tests.ps1` files produced there.\n+- Research produced no additional spike-specific implementation pattern. Implement from the plan's resolved contracts and the merged task-1 design; do not copy or adapt research artifact code.\n+\n+## Branch and execution order\n+\n+Target `experiment/shepherd-control` as the PR base branch. This is task 2 of 2. The tasks are assigned, completed, and merged serially in plan order. Do not start until this issue is assigned and task 1 has been merged into `experiment/shepherd-control`.\n+\n+Keep the issue unassigned until the campaign owner dispatches it. Base the work on the latest `experiment/shepherd-control` so the merged Fibonacci implementation and tests are present.\n+\n+## Implement\n+\n+Extend repository-root `math-tool.ps1` with:\n+\n+- A pure `Get-Factorial` function that returns the numeric factorial value and emits no incidental output.\n+- Correct factorial behavior for `N=0`, `N=1`, and representative positive values.\n+- An `Operation` parameter that dispatches between `fibonacci` and `factorial` while retaining the existing `N` parameter.\n+- Direct-execution output of exactly `Fibonacci(N) = value` for Fibonacci and `Factorial(N) = value` for factorial.\n+- Preservation of all Fibonacci function and CLI behavior delivered by task 1.\n+\n+Extend repository-root `math-tool.Tests.ps1` with focused production tests that:\n+\n+- Unit-test `Get-Factorial` by dot-sourcing the production script.\n+- Exercise factorial CLI dispatch in isolated child-`pwsh` processes.\n+- Cover factorial edge cases 0 and 1 plus at least one small representative positive value.\n+- Retain and pass the complete Fibonacci regression suite.\n+- Assert dispatch selects the requested operation and does not emit output from the non-selected operation.\n+- Assert each direct CLI call emits exactly one correctly labeled result line and each function emits only its numeric return value.\n+\n+Follow the existing task-1 interface and repository PowerShell/Pester conventions. Keep the extension objective and small.\n+\n+## Completion gates\n+\n+- Run `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`; the combined Fibonacci and factorial regression suite must exit zero using the pinned Pester 5.7.1 setup.\n+- Confirm factorial function results for 0, 1, and the representative input are numeric and have no incidental pipeline output.\n+- Confirm isolated CLI invocations for both operations exit zero and stdout is exactly one expected result line with the correct operation label and value.\n+- Confirm all task-1 Fibonacci unit and CLI tests still pass unchanged in behavior.\n+- Confirm the test runner discovers the combined tests and the pull-request workflow `.github/workflows/shepherd-task-math-tool.yml` passes without changing its pinned Pester version or bypassing the repository-owned runner.\n+\n+## Out of scope\n+\n+- Do not replace or redesign the task-1 Fibonacci implementation beyond changes required to add operation dispatch.\n+- Do not change the canonical test runner or CI workflow.\n+- Do not add operations other than `fibonacci` and `factorial`, add dependencies, or broaden the input domain beyond non-negative integers.\n+- Do not introduce interactive prompts, multiple result lines, or incidental function output.\n+- Do not modify files other than `math-tool.ps1` and `math-tool.Tests.ps1` unless a repository-required formatting artifact is unavoidable.\n+- Do not read, copy, adapt, or promote spike source code into production or production tests.\n*** End Patch\n"
```

</details>

```
Added 2 file(s): C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829\issue-bodies\01-1-implement-fibonacci-body.md, C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829\issue-bodies\02-2-add-factorial-dispatch-body.md
```


---

<sub>1m 36s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829\issue-bodies\01-1-implement-fibonacci-body.md.**

C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829\issue-bodies\01-1-implement-fibonacci-body.md

<details>
<summary>42 lines</summary>

```
## Campaign context and required reading

**On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.**

Read the entire plan before working. Then re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`

Apply these resolved decisions:

- Repository acceptance is defined by `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and invokes that repository-owned runner; do not replace or bypass either contract.
- Direct CLI execution writes exactly one result line to stdout in the form `Fibonacci(N) = value`.
- Functions return their numeric value without incidental output.
- Inputs are non-negative integers.
- The production and test files are repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.
- Research produced no additional spike-specific implementation pattern. Implement from the plan's resolved contracts and repository conventions; do not copy or adapt research artifact code.

## Branch and execution order

Target `experiment/shepherd-control` as the PR base branch. This is task 1 of 2. The tasks are assigned, completed, and merged serially in plan order. Do not start until this issue is assigned. Task 2 starts only after this task is merged.

Keep the issue unassigned until the campaign owner dispatches it. Make only the changes required by this task on a branch based on the latest `experiment/shepherd-control`.

## Implement

Create repository-root `math-tool.ps1` with:

- A script parameter named `N` accepting non-negative integer input.
- A pure `Get-Fibonacci` function that returns the numeric Fibonacci value and emits no incidental output.
- Direct-execution behavior that calls the function and writes exactly one stdout line: `Fibonacci(N) = value`.
- Correct behavior for `N=0`, `N=1`, and representative positive values.

Create repository-root `math-tool.Tests.ps1` with:

- Dot-sourced Pester unit tests for `Get-Fibonacci`.
- Isolated child-`pwsh` process tests for direct CLI behavior, so CLI output assertions do not depend on the test process's loaded script state.
- Coverage for `N=0`, `N=1`, and at least one small representative positive value at both the function and CLI contract levels where appropriate.
- Assertions that discriminate the numeric function return from formatted CLI output and ensure direct execution produces exactly one expected result line.

Follow existing PowerShell and Pester conventions in the repository. Keep the implementation objective and small.

## Completion gates

- Run `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`; it must exit zero using the pinned Pester 5.7.1 setup.
- Confirm `Get-Fibonacci` returns numeric values for 0, 1, and the representative input without extra pipeline output.
- Confirm each isolated CLI invocation exits zero and stdout is exactly one line matching `Fibonacci(N) = value`, with no headings, diagnostics, blank result lines, or test-process leakage.
- Confirm the test runner discovers and executes `math-tool.Tests.ps1`.
- Confirm the pull-request workflow `.github/workflows/shepherd-task-math-tool.yml` passes without changing its pinned Pester version or bypassing the repository-owned runner.

## Out of scope

- Do not add factorial, operation dispatch, or an `Operation` parameter; those belong to task 2.
- Do not change the canonical test runner or CI workflow.
- Do not add dependencies or broaden the accepted input domain beyond non-negative integers.
- Do not modify files other than `math-tool.ps1` and `math-tool.Tests.ps1` unless a repository-required formatting artifact is unavoidable.
- Do not read, copy, adapt, or promote spike source code into production or production tests.
```

</details>


---

<sub>1m 36s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829\issue-bodies\02-2-add-factorial-dispatch-body.md.**

C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829\issue-bodies\02-2-add-factorial-dispatch-body.md

<details>
<summary>47 lines</summary>

```
## Campaign context and required reading

**On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.**

Read the entire plan before working. Then re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`
- `### 2. Add factorial and operation dispatch`

Apply these resolved decisions:

- Repository acceptance is defined by `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and invokes that repository-owned runner; do not replace or bypass either contract.
- Direct CLI execution writes exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`, selected by the requested operation.
- Both functions return numeric values without incidental output.
- Inputs are non-negative integers.
- This task depends on merged task 1 and extends the repository-root `math-tool.ps1` and `math-tool.Tests.ps1` files produced there.
- Research produced no additional spike-specific implementation pattern. Implement from the plan's resolved contracts and the merged task-1 design; do not copy or adapt research artifact code.

## Branch and execution order

Target `experiment/shepherd-control` as the PR base branch. This is task 2 of 2. The tasks are assigned, completed, and merged serially in plan order. Do not start until this issue is assigned and task 1 has been merged into `experiment/shepherd-control`.

Keep the issue unassigned until the campaign owner dispatches it. Base the work on the latest `experiment/shepherd-control` so the merged Fibonacci implementation and tests are present.

## Implement

Extend repository-root `math-tool.ps1` with:

- A pure `Get-Factorial` function that returns the numeric factorial value and emits no incidental output.
- Correct factorial behavior for `N=0`, `N=1`, and representative positive values.
- An `Operation` parameter that dispatches between `fibonacci` and `factorial` while retaining the existing `N` parameter.
- Direct-execution output of exactly `Fibonacci(N) = value` for Fibonacci and `Factorial(N) = value` for factorial.
- Preservation of all Fibonacci function and CLI behavior delivered by task 1.

Extend repository-root `math-tool.Tests.ps1` with focused production tests that:

- Unit-test `Get-Factorial` by dot-sourcing the production script.
- Exercise factorial CLI dispatch in isolated child-`pwsh` processes.
- Cover factorial edge cases 0 and 1 plus at least one small representative positive value.
- Retain and pass the complete Fibonacci regression suite.
- Assert dispatch selects the requested operation and does not emit output from the non-selected operation.
- Assert each direct CLI call emits exactly one correctly labeled result line and each function emits only its numeric return value.

Follow the existing task-1 interface and repository PowerShell/Pester conventions. Keep the extension objective and small.

## Completion gates

- Run `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`; the combined Fibonacci and factorial regression suite must exit zero using the pinned Pester 5.7.1 setup.
- Confirm factorial function results for 0, 1, and the representative input are numeric and have no incidental pipeline output.
- Confirm isolated CLI invocations for both operations exit zero and stdout is exactly one expected result line with the correct operation label and value.
- Confirm all task-1 Fibonacci unit and CLI tests still pass unchanged in behavior.
- Confirm the test runner discovers the combined tests and the pull-request workflow `.github/workflows/shepherd-task-math-tool.yml` passes without changing its pinned Pester version or bypassing the repository-owned runner.

## Out of scope

- Do not replace or redesign the task-1 Fibonacci implementation beyond changes required to add operation dispatch.
- Do not change the canonical test runner or CI workflow.
- Do not add operations other than `fibonacci` and `factorial`, add dependencies, or broaden the input domain beyond non-negative integers.
- Do not introduce interactive prompts, multiple result lines, or incidental function output.
- Do not modify files other than `math-tool.ps1` and `math-tool.Tests.ps1` unless a repository-required formatting artifact is unavoidable.
- Do not read, copy, adapt, or promote spike source code into production or production tests.
```

</details>


---

<sub>1m 37s</sub>

### `powershell`

**Validate persisted issue drafts**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $logDir='C:\\Users\\edburns\\workareas\\dd-3068633-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260924-0829'; & 'C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\validate-stage20-drafts.ps1' -BodyDirectory (Join-Path $logDir 'issue-bodies') -ExpectedCount 2 -LessonPropagation off; if($LASTEXITCODE -ne 0){throw 'Draft validator failed.'}; Get-ChildItem -LiteralPath $logDir -Force | Select-Object Name,Length,Mode | Format-Table -AutoSize",
  "description": "Validate persisted issue drafts"
}
```

</details>

<details>
<summary>13 lines</summary>

```
Directory: C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\p
rompts\shepherd-task-20-20260924-0829\issue-bodies

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---           9/24/2026  8:31 AM           4242 01-1-implement-fibonacci-body.md
-a---           9/24/2026  8:31 AM           4878 02-2-add-factorial-dispatch-body.md


Name                                                                    Length Mode
----                                                                    ------ ----
issue-bodies                                                                   d----
20260924-0829-invoke-shepherd-task-20-create-issues-from-plan-skill.md  1625   -a---
20260924-0829-invoke-shepherd-task-20-create-issues-from-plan-skill.ps1 2381   -a---
create-issues-otel-20260924-0829.jsonl                                  21699  -a---
<shellId: 6 completed with exit code 0>
```

</details>


---

<sub>1m 55s</sub>

### Copilot

The persisted drafts pass the stage validator and contain the complete resolved contracts. I’m starting the one-shot create/verify/link sequence now; the ledger and stage result will be written atomically, and any mutation failure will stop creation and reconcile without rollback.

---

<sub>2m 22s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-0829/run-stage20.ps1\n+[CmdletBinding()]\n+param()\n+\n+Set-StrictMode -Version Latest\n+$ErrorActionPreference = 'Stop'\n+$PSNativeCommandUseErrorActionPreference = $false\n+\n+$repo = 'edburns/dd-3068633-win32-x64-03'\n+$parentIssue = 1\n+$logDirectory = 'C:\\Users\\edburns\\workareas\\dd-3068633-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260924-0829'\n+$ledgerPath = Join-Path $logDirectory 'creation-ledger.json'\n+$resultPath = Join-Path $logDirectory 'stage-20-result.json'\n+$verifier = 'C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-github-issue-body.ps1'\n+$selectedIssueType = $null\n+$tasks = @(\n+    [pscustomobject]@{\n+        implementationSubsection = '1. Implement Fibonacci with unit and isolated CLI coverage'\n+        bodyFile = 'issue-bodies\\01-1-implement-fibonacci-body.md'\n+        title = '1. Implement Fibonacci with unit and isolated CLI coverage'\n+    },\n+    [pscustomobject]@{\n+        implementationSubsection = '2. Add factorial and operation dispatch'\n+        bodyFile = 'issue-bodies\\02-2-add-factorial-dispatch-body.md'\n+        title = '2. Add factorial and operation dispatch'\n+    }\n+)\n+\n+function Write-AtomicText {\n+    param(\n+        [Parameter(Mandatory)][string]$Path,\n+        [Parameter(Mandatory)][AllowEmptyString()][string]$Content\n+    )\n+\n+    $temporaryPath = \"$Path.$([guid]::NewGuid().ToString('N')).tmp\"\n+    try {\n+        [IO.File]::WriteAllText($temporaryPath, $Content, [Text.UTF8Encoding]::new($false))\n+        Move-Item -LiteralPath $temporaryPath -Destination $Path -Force\n+    }\n+    finally {\n+        if (Test-Path -LiteralPath $temporaryPath) {\n+            Remove-Item -LiteralPath $temporaryPath -Force\n+        }\n+    }\n+}\n+\n+function Write-Result {\n+    param(\n+        [Parameter(Mandatory)][ValidateSet('in_progress', 'complete', 'failed')][string]$Status,\n+        [AllowNull()][string]$OperationError\n+    )\n+\n+    $result = [ordered]@{\n+        schemaVersion = 1\n+        status = $Status\n+        ledgerFile = 'creation-ledger.json'\n+        operationError = $OperationError\n+    }\n+    Write-AtomicText -Path $resultPath -Content ($result | ConvertTo-Json -Depth 4)\n+}\n+\n+function Read-CreationLedger {\n+    $parsed = [IO.File]::ReadAllText($ledgerPath) |\n+        ConvertFrom-Json -NoEnumerate\n+    if ($parsed -isnot [System.Array]) {\n+        throw 'Creation ledger JSON root must be an array.'\n+    }\n+\n+    $ledger = [object[]]$parsed\n+    if (@($ledger | Where-Object { $_ -is [System.Array] }).Count -ne 0) {\n+        throw 'Creation ledger must not contain nested array entries.'\n+    }\n+    return $ledger\n+}\n+\n+function Write-CreationLedger {\n+    param([Parameter(Mandatory)][AllowEmptyCollection()][object[]]$Ledger)\n+\n+    $json = ConvertTo-Json -InputObject ([object[]]$Ledger) -Depth 10\n+    Write-AtomicText -Path $ledgerPath -Content $json\n+}\n+\n+function Update-LedgerFlag {\n+    param(\n+        [Parameter(Mandatory)][int]$Number,\n+        [Parameter(Mandatory)][ValidateSet('body_verified', 'linked')][string]$Field,\n+        [Parameter(Mandatory)][bool]$Value\n+    )\n+\n+    $ledger = @(Read-CreationLedger)\n+    $entry = @($ledger | Where-Object { $_.number -eq $Number })\n+    if ($entry.Count -ne 1) {\n+        throw \"Expected exactly one ledger entry for issue #$Number.\"\n+    }\n+    $entry[0].$Field = $Value\n+    Write-CreationLedger -Ledger $ledger\n+}\n+\n+function Get-NormalizedChildren {\n+    $childrenOutput = & gh api \"repos/$repo/issues/$parentIssue/sub_issues\" --paginate --slurp 2>&1\n+    $childrenExitCode = $LASTEXITCODE\n+    if ($childrenExitCode -ne 0) {\n+        throw \"Unable to query parent children: $($childrenOutput | Out-String)\"\n+    }\n+\n+    $completeJson = $childrenOutput | Out-String\n+    $normalizedJson = $completeJson |\n+        jq 'if length == 0 then [] elif all(.[]; type == \"array\") then add else . end'\n+    $jqExitCode = $LASTEXITCODE\n+    if ($jqExitCode -ne 0) {\n+        throw 'Unable to normalize the paginated child response.'\n+    }\n+\n+    $children = @(($normalizedJson | Out-String) | ConvertFrom-Json)\n+    if (@($children | Where-Object { $_ -is [System.Array] }).Count -ne 0) {\n+        throw 'Normalized child response contains a nested array.'\n+    }\n+    return $children\n+}\n+\n+function Reconcile-Failure {\n+    param([Parameter(Mandatory)][string]$OperationError)\n+\n+    try {\n+        $serverChildren = @(Get-NormalizedChildren)\n+        $childIds = @($serverChildren | ForEach-Object { [long]$_.id })\n+        $ledger = @(Read-CreationLedger)\n+        foreach ($entry in $ledger) {\n+            $issueOutput = & gh api \"repos/$repo/issues/$($entry.number)\" 2>&1\n+            $issueExitCode = $LASTEXITCODE\n+            if ($issueExitCode -ne 0) {\n+                $OperationError += \" Reconciliation lookup for issue #$($entry.number) failed: $($issueOutput | Out-String)\"\n+            }\n+            $entry.linked = $childIds -contains [long]$entry.id\n+        }\n+        Write-CreationLedger -Ledger $ledger\n+    }\n+    catch {\n+        $OperationError += \" Reconciliation failed: $($_.Exception.Message)\"\n+    }\n+\n+    Write-Result -Status failed -OperationError $OperationError\n+    $reconciled = @(Read-CreationLedger)\n+    if ($reconciled.Count -eq 0) {\n+        Write-Output 'No issues were created; no cleanup is required.'\n+        return\n+    }\n+\n+    Write-Output ($reconciled |\n+        Select-Object number, title, url, bodyFile, body_verified, linked |\n+        Format-Table -AutoSize |\n+        Out-String)\n+    foreach ($entry in $reconciled) {\n+        Write-Output \"gh issue delete $($entry.number) --repo `\"$repo`\" --yes\"\n+    }\n+    Write-Output 'The operation did not complete. No automatic rollback was performed. Delete every issue in the ledger before invoking stage 20 again.'\n+}\n+\n+$baseline = @()\n+try {\n+    $baseline = @(Get-NormalizedChildren)\n+    Write-CreationLedger -Ledger ([object[]]@())\n+    Write-Result -Status in_progress -OperationError $null\n+\n+    foreach ($task in $tasks) {\n+        $bodyPath = Join-Path $logDirectory $task.bodyFile\n+        $createArguments = @(\n+            'api',\n+            \"repos/$repo/issues\",\n+            '-X', 'POST',\n+            '-f', \"title=$($task.title)\",\n+            '-F', \"body=@$bodyPath\"\n+        )\n+        if ($selectedIssueType) {\n+            $createArguments += @('-f', \"type=$selectedIssueType\")\n+        }\n+\n+        $createOutput = & gh @createArguments 2>&1\n+        $createExitCode = $LASTEXITCODE\n+        if ($createExitCode -ne 0) {\n+            throw \"Create failed for '$($task.implementationSubsection)': $($createOutput | Out-String)\"\n+        }\n+        $created = ($createOutput | Out-String) | ConvertFrom-Json\n+\n+        $ledger = @(Read-CreationLedger)\n+        $ledger += [pscustomobject][ordered]@{\n+            implementationSubsection = $task.implementationSubsection\n+            bodyFile = $task.bodyFile\n+            id = [long]$created.id\n+            number = [int]$created.number\n+            title = [string]$created.title\n+            url = [string]$created.html_url\n+            body_verified = $false\n+            linked = $false\n+        }\n+        Write-CreationLedger -Ledger $ledger\n+\n+        $null = & $verifier `\n+            -Repository $repo `\n+            -IssueNumber ([int]$created.number) `\n+            -ExpectedBodyPath $bodyPath `\n+            -MaxAttempts 6 `\n+            -DelaySeconds 5 `\n+            -DiagnosticPath (Join-Path $logDirectory \"issue-$($created.number)-body-verification-failure.json\")\n+        Update-LedgerFlag -Number ([int]$created.number) -Field body_verified -Value $true\n+\n+        $payloadPath = Join-Path $logDirectory \"issue-$($created.number)-link-payload.json\"\n+        try {\n+            Write-AtomicText -Path $payloadPath -Content (@{ sub_issue_id = [long]$created.id } | ConvertTo-Json -Compress)\n+            $linked = $false\n+            $lastLinkError = ''\n+            for ($attempt = 1; $attempt -le 3; $attempt++) {\n+                $linkOutput = & gh api \"repos/$repo/issues/$parentIssue/sub_issues\" -X POST --input $payloadPath 2>&1\n+                $linkExitCode = $LASTEXITCODE\n+                if ($linkExitCode -eq 0) {\n+                    $linked = $true\n+                    break\n+                }\n+                $lastLinkError = $linkOutput | Out-String\n+                if ($attempt -lt 3) {\n+                    Start-Sleep -Seconds 2\n+                }\n+            }\n+            if (-not $linked) {\n+                throw \"Link failed for issue #$($created.number) after 3 attempts: $lastLinkError\"\n+            }\n+        }\n+        finally {\n+            if (Test-Path -LiteralPath $payloadPath) {\n+                Remove-Item -LiteralPath $payloadPath -Force\n+            }\n+        }\n+        Update-LedgerFlag -Number ([int]$created.number) -Field linked -Value $true\n+    }\n+\n+    $ledger = @(Read-CreationLedger)\n+    $finalChildren = @(Get-NormalizedChildren)\n+    if ($finalChildren.Count -ne $baseline.Count + $ledger.Count) {\n+        throw \"Final child count $($finalChildren.Count) did not equal baseline $($baseline.Count) plus ledger $($ledger.Count).\"\n+    }\n+\n+    $baselineIds = @($baseline | ForEach-Object { [long]$_.id })\n+    $newChildren = @($finalChildren | Where-Object { $baselineIds -notcontains [long]$_.id })\n+    if ($newChildren.Count -ne $ledger.Count) {\n+        throw 'The set of newly linked children does not match the creation ledger count.'\n+    }\n+    for ($index = 0; $index -lt $ledger.Count; $index++) {\n+        $matches = @($finalChildren | Where-Object { [long]$_.id -eq [long]$ledger[$index].id })\n+        if ($matches.Count -ne 1) {\n+            throw \"Issue #$($ledger[$index].number) is not linked exactly once.\"\n+        }\n+        if ([long]$newChildren[$index].id -ne [long]$ledger[$index].id) {\n+            throw 'New child order does not match implementation plan order.'\n+        }\n+\n+        $bodyPath = Join-Path $logDirectory $ledger[$index].bodyFile\n+        $issue = & $verifier `\n+            -Repository $repo `\n+            -IssueNumber ([int]$ledger[$index].number) `\n+            -ExpectedBodyPath $bodyPath `\n+            -MaxAttempts 6 `\n+            -DelaySeconds 5 `\n+            -DiagnosticPath (Join-Path $logDirectory \"issue-$($ledger[$index].number)-body-verification-failure.json\")\n+        if ($issue.state -ne 'open') {\n+            throw \"Issue #$($ledger[$index].number) is not open.\"\n+        }\n+        if (@($issue.assignees).Count -ne 0) {\n+            throw \"Issue #$($ledger[$index].number) is assigned.\"\n+        }\n+        if ($selectedIssueType -and $issue.type.name -ne $selectedIssueType) {\n+            throw \"Issue #$($ledger[$index].number) does not have type $selectedIssueType.\"\n+        }\n+    }\n+\n+    Write-Result -Status complete -OperationError $null\n+    Write-Output ($ledger | ConvertTo-Json -Depth 10)\n+}\n+catch {\n+    $message = $_.Exception.Message\n+    Reconcile-Failure -OperationError $message\n+    throw $message\n+}\n*** End Patch\n"
```

</details>

```
Added 1 file(s): C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829\run-stage20.ps1
```


---

<sub>2m 34s</sub>

### `powershell`

**Create and verify ordered child issues**

<details>
<summary>Arguments</summary>

```json
{
  "command": "& 'C:\\Users\\edburns\\workareas\\dd-3068633-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260924-0829\\run-stage20.ps1'",
  "description": "Create and verify ordered child issues",
  "initial_wait": 120,
  "mode": "sync"
}
```

</details>

<details>
<summary>23 lines</summary>

```
[
  {
    "implementationSubsection": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "bodyFile": "issue-bodies\\01-1-implement-fibonacci-body.md",
    "id": 5568350179,
    "number": 2,
    "title": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "url": "https://github.com/edburns/dd-3068633-win32-x64-03/issues/2",
    "body_verified": true,
    "linked": true
  },
  {
    "implementationSubsection": "2. Add factorial and operation dispatch",
    "bodyFile": "issue-bodies\\02-2-add-factorial-dispatch-body.md",
    "id": 5568350799,
    "number": 3,
    "title": "2. Add factorial and operation dispatch",
    "url": "https://github.com/edburns/dd-3068633-win32-x64-03/issues/3",
    "body_verified": true,
    "linked": true
  }
]
<shellId: 7 completed with exit code 0>
```

</details>


---

<sub>2m 39s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829\stage-20-result.json.**

C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829\stage-20-result.json

<details>
<summary>6 lines</summary>

```
{
  "schemaVersion": 1,
  "status": "complete",
  "ledgerFile": "creation-ledger.json",
  "operationError": ""
}
```

</details>


---

<sub>2m 39s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829\creation-ledger.json.**

C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829\creation-ledger.json

<details>
<summary>22 lines</summary>

```
[
  {
    "implementationSubsection": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "bodyFile": "issue-bodies\\01-1-implement-fibonacci-body.md",
    "id": 5568350179,
    "number": 2,
    "title": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "url": "https://github.com/edburns/dd-3068633-win32-x64-03/issues/2",
    "body_verified": true,
    "linked": true
  },
  {
    "implementationSubsection": "2. Add factorial and operation dispatch",
    "bodyFile": "issue-bodies\\02-2-add-factorial-dispatch-body.md",
    "id": 5568350799,
    "number": 3,
    "title": "2. Add factorial and operation dispatch",
    "url": "https://github.com/edburns/dd-3068633-win32-x64-03/issues/3",
    "body_verified": true,
    "linked": true
  }
]
```

</details>


---

<sub>2m 43s</sub>

### Copilot

The two issues were created, body-verified, linked in plan order, and left unassigned. The final status document exposed a PowerShell null-coercion defect (`""` instead of JSON `null`), so I’m correcting that artifact without rerunning or mutating the one-shot GitHub operation.

---

<sub>2m 46s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Update File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-0829/run-stage20.ps1\n@@\n-        [AllowNull()][string]$OperationError\n+        [AllowNull()][object]$OperationError\n*** End Patch\n"
```

</details>

```
Modified 1 file(s): C:\Users\edburns\workareas\dd-3068633-win32-x64-03-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260924-0829\run-stage20.ps1
```


---

<sub>2m 52s</sub>

### `powershell`

**Correct final stage result atomically**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $path='C:\\Users\\edburns\\workareas\\dd-3068633-win32-x64-03-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260924-0829\\stage-20-result.json'; $temp=\"$path.$([guid]::NewGuid().ToString('N')).tmp\"; $result=[ordered]@{schemaVersion=1;status='complete';ledgerFile='creation-ledger.json';operationError=$null}; try { [IO.File]::WriteAllText($temp,($result|ConvertTo-Json -Depth 4),[Text.UTF8Encoding]::new($false)); Move-Item -LiteralPath $temp -Destination $path -Force } finally { if(Test-Path -LiteralPath $temp){Remove-Item -LiteralPath $temp -Force} }; Get-Content -LiteralPath $path -Raw",
  "description": "Correct final stage result atomically"
}
```

</details>

<details>
<summary>7 lines</summary>

```
{
  "schemaVersion": 1,
  "status": "complete",
  "ledgerFile": "creation-ledger.json",
  "operationError": null
}
<shellId: 8 completed with exit code 0>
```

</details>


---

<sub>2m 56s</sub>

### Copilot

Created and verified **2 ordered child issues** under #1. Both are open, unassigned, body-verified, and linked in plan order.

| Implementation subsection | Issue | Title | URL |
|---|---:|---|---|
| 1. Implement Fibonacci with unit and isolated CLI coverage | #2 | 1. Implement Fibonacci with unit and isolated CLI coverage | https://github.com/edburns/dd-3068633-win32-x64-03/issues/2 |
| 2. Add factorial and operation dispatch | #3 | 2. Add factorial and operation dispatch | https://github.com/edburns/dd-3068633-win32-x64-03/issues/3 |

**Given-list issue numbers:** `2,3`

**Suggested stage 25 invocation:** Invoke `shepherd-task-25-given-list` with `REPO=edburns/dd-3068633-win32-x64-03`, `BASE_BRANCH=experiment/shepherd-control`, `PLAN_DIRECTORY=1-math-control-remove-before-merge`, and ordered issues `2,3`.

The repository owner is a user account, so the issues were created **without an issue type**. The persistent stage result is `complete` with `operationError: null`.

---

<sub>Generated by [GitHub Copilot CLI](https://github.com/features/copilot/cli)</sub>
