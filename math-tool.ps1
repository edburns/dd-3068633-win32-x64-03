[CmdletBinding()]
param(
    [ValidateRange(0, [int]::MaxValue)]
    [int] $N = 0
)

Set-StrictMode -Version Latest

function Get-Fibonacci {
    <#
    .SYNOPSIS
    Returns the Fibonacci number for a non-negative integer.

    .PARAMETER N
    The non-negative integer position to evaluate.

    .OUTPUTS
    System.Numerics.BigInteger
    #>
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

# Suppress CLI output when tests dot-source this script to load functions.
if ($MyInvocation.InvocationName -ne '.') {
    $value = Get-Fibonacci -N $N
    Write-Output "Fibonacci($N) = $value"
}
