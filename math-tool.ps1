[CmdletBinding()]
param(
    [ValidateSet('fibonacci', 'factorial')]
    [string] $Operation = 'fibonacci',

    [ValidateRange(0, [int]::MaxValue)]
    [int] $N = 0
)

Set-StrictMode -Version Latest

function Get-Fibonacci {
    <#
    .SYNOPSIS
    Returns the Fibonacci number for a non-negative integer.

    .PARAMETER N
    The non-negative Int32 position to evaluate.

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

function Get-Factorial {
    <#
    .SYNOPSIS
    Returns the factorial for a non-negative integer.

    .PARAMETER N
    The non-negative Int32 value to evaluate.

    .OUTPUTS
    System.Numerics.BigInteger
    #>
    [CmdletBinding()]
    param(
        [ValidateRange(0, [int]::MaxValue)]
        [int] $N
    )

    $value = [System.Numerics.BigInteger] 1
    for ($i = 2; $i -le $N; $i++) {
        $value *= $i
    }

    return $value
}

$isDotSourced = $MyInvocation.InvocationName -eq '.'

# Suppress CLI output when tests dot-source this script to load functions.
if (-not $isDotSourced) {
    switch ($Operation) {
        'fibonacci' {
            $value = Get-Fibonacci -N $N
            Write-Output "Fibonacci($N) = $value"
        }
        'factorial' {
            $value = Get-Factorial -N $N
            Write-Output "Factorial($N) = $value"
        }
        default {
            # Defensive guard if parameter validation changes without updating dispatch.
            throw "Unsupported operation '$Operation'."
        }
    }
}
