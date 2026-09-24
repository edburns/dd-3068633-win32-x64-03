[CmdletBinding()]
param(
    [ValidateRange(0, [int]::MaxValue)]
    [int] $N = 0
)

Set-StrictMode -Version Latest

function Get-Fibonacci {
    [CmdletBinding()]
    param(
        [ValidateRange(0, [int]::MaxValue)]
        [int] $N
    )

    if ($N -lt 2) {
        return [System.Numerics.BigInteger] $N
    }

    $previous = [System.Numerics.BigInteger] 0
    $current = [System.Numerics.BigInteger] 1

    for ($i = 2; $i -le $N; $i++) {
        $next = $previous + $current
        $previous = $current
        $current = $next
    }

    return $current
}

$invokedScriptPath = [System.IO.Path]::GetFullPath($MyInvocation.MyCommand.Path)
$currentScriptPath = [System.IO.Path]::GetFullPath($PSCommandPath)

if ($invokedScriptPath -eq $currentScriptPath -and $MyInvocation.InvocationName -ne '.') {
    $value = Get-Fibonacci -N $N
    Write-Output "Fibonacci($N) = $value"
}
