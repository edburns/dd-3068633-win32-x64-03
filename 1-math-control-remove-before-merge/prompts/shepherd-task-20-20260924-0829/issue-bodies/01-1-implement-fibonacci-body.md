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
