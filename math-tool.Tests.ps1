[CmdletBinding()]
param()

Set-StrictMode -Version Latest

BeforeAll {
    $script:MathToolPath = Join-Path $PSScriptRoot 'math-tool.ps1'
    . $script:MathToolPath
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

Describe 'math-tool.ps1 CLI' {
    It 'writes exactly one result line for N=<N>' -ForEach @(
        @{ N = 0; Expected = 'Fibonacci(0) = 0' }
        @{ N = 1; Expected = 'Fibonacci(1) = 1' }
        @{ N = 6; Expected = 'Fibonacci(6) = 8' }
    ) {
        $startInfo = [System.Diagnostics.ProcessStartInfo]::new()
        $startInfo.FileName = (Get-Command pwsh).Source
        $startInfo.ArgumentList.Add('-NoLogo')
        $startInfo.ArgumentList.Add('-NoProfile')
        $startInfo.ArgumentList.Add('-File')
        $startInfo.ArgumentList.Add($script:MathToolPath)
        $startInfo.ArgumentList.Add('-N')
        $startInfo.ArgumentList.Add([string] $N)
        $startInfo.RedirectStandardOutput = $true
        $startInfo.RedirectStandardError = $true
        $startInfo.UseShellExecute = $false

        $process = [System.Diagnostics.Process]::Start($startInfo)
        $stdout = $process.StandardOutput.ReadToEnd()
        $stderr = $process.StandardError.ReadToEnd()
        $process.WaitForExit()

        $process.ExitCode | Should -Be 0
        $stderr | Should -Be ''
        $stdout | Should -Be "$Expected$([Environment]::NewLine)"
    }
}
