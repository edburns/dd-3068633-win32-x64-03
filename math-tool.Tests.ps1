[CmdletBinding()]
param()

Set-StrictMode -Version Latest

BeforeAll {
    $script:MathToolPath = Join-Path $PSScriptRoot 'math-tool.ps1'
    . $script:MathToolPath

    $script:PowerShellPath = Get-Command pwsh -CommandType Application -ErrorAction SilentlyContinue |
        Select-Object -First 1 -ExpandProperty Source
    if (-not $script:PowerShellPath) {
        throw 'PowerShell 7 executable pwsh is required for isolated CLI tests.'
    }
    $script:CliTimeoutMs = 10000

    function Invoke-MathToolCli {
        param(
            [ValidateSet('fibonacci', 'factorial')]
            [string] $Operation,

            [int] $N
        )

        $startInfo = [System.Diagnostics.ProcessStartInfo]::new()
        $startInfo.FileName = $script:PowerShellPath
        $startInfo.ArgumentList.Add('-NoLogo')
        $startInfo.ArgumentList.Add('-NoProfile')
        $startInfo.ArgumentList.Add('-File')
        $startInfo.ArgumentList.Add($script:MathToolPath)
        if ($PSBoundParameters.ContainsKey('Operation')) {
            $startInfo.ArgumentList.Add('-Operation')
            $startInfo.ArgumentList.Add($Operation)
        }
        $startInfo.ArgumentList.Add('-N')
        $startInfo.ArgumentList.Add([string] $N)
        $startInfo.RedirectStandardOutput = $true
        $startInfo.RedirectStandardError = $true
        $startInfo.UseShellExecute = $false

        $process = [System.Diagnostics.Process]::Start($startInfo)
        try {
            $stdoutTask = $process.StandardOutput.ReadToEndAsync()
            $stderrTask = $process.StandardError.ReadToEndAsync()
            $exited = $process.WaitForExit($script:CliTimeoutMs)
            if (-not $exited) {
                $process.Kill($true)
                throw 'Timed out waiting for math-tool.ps1 CLI process to exit.'
            }

            $process.WaitForExit()
            return @{
                ExitCode = $process.ExitCode
                StdOut = $stdoutTask.GetAwaiter().GetResult()
                StdErr = $stderrTask.GetAwaiter().GetResult()
            }
        }
        finally {
            $process.Dispose()
        }
    }
}

Describe 'Get-Fibonacci' {
    It 'returns numeric <Expected> for N=<N> without formatted output' -ForEach @(
        @{ N = 0; Expected = [System.Numerics.BigInteger] 0 }
        @{ N = 1; Expected = [System.Numerics.BigInteger] 1 }
        @{ N = 6; Expected = [System.Numerics.BigInteger] 8 }
    ) {
        $result = @(Get-Fibonacci -N $N)

        $result | Should -HaveCount 1
        $result[0] | Should -BeOfType ([System.Numerics.BigInteger])
        $result[0] | Should -Be $Expected
    }
}

Describe 'Get-Factorial' {
    It 'returns numeric <Expected> for N=<N> without formatted output' -ForEach @(
        @{ N = 0; Expected = [System.Numerics.BigInteger] 1 }
        @{ N = 1; Expected = [System.Numerics.BigInteger] 1 }
        @{ N = 5; Expected = [System.Numerics.BigInteger] 120 }
    ) {
        $result = @(Get-Factorial -N $N)

        $result | Should -HaveCount 1
        $result[0] | Should -BeOfType ([System.Numerics.BigInteger])
        $result[0] | Should -Be $Expected
    }
}

Describe 'math-tool.ps1 CLI' {
    It 'writes exactly one result line for N=<N>' -ForEach @(
        @{ N = 0; Expected = 'Fibonacci(0) = 0' }
        @{ N = 1; Expected = 'Fibonacci(1) = 1' }
        @{ N = 6; Expected = 'Fibonacci(6) = 8' }
    ) {
        $result = Invoke-MathToolCli -N $N

        $result.ExitCode | Should -Be 0
        $result.StdErr | Should -Be ''
        $result.StdOut | Should -Match ('^{0}\r?\n$' -f [regex]::Escape($Expected))
    }

    It 'writes exactly one factorial result line for N=<N>' -ForEach @(
        @{ N = 0; Expected = 'Factorial(0) = 1' }
        @{ N = 1; Expected = 'Factorial(1) = 1' }
        @{ N = 5; Expected = 'Factorial(5) = 120' }
    ) {
        $result = Invoke-MathToolCli -Operation factorial -N $N

        $result.ExitCode | Should -Be 0
        $result.StdErr | Should -Be ''
        $result.StdOut | Should -Match ('^{0}\r?\n$' -f [regex]::Escape($Expected))
    }

    It 'dispatches to fibonacci without factorial output' {
        $result = Invoke-MathToolCli -Operation fibonacci -N 5

        $result.ExitCode | Should -Be 0
        $result.StdErr | Should -Be ''
        $result.StdOut | Should -Be "Fibonacci(5) = 5$([Environment]::NewLine)"
        $result.StdOut | Should -Not -Match 'Factorial'
    }

    It 'dispatches to factorial without fibonacci output' {
        $result = Invoke-MathToolCli -Operation factorial -N 5

        $result.ExitCode | Should -Be 0
        $result.StdErr | Should -Be ''
        $result.StdOut | Should -Be "Factorial(5) = 120$([Environment]::NewLine)"
        $result.StdOut | Should -Not -Match 'Fibonacci'
    }
}
