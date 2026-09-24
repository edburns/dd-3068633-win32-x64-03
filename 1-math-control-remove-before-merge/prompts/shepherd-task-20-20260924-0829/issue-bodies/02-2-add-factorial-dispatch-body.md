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
