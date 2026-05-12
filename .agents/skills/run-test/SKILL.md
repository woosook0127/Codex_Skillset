---
name: run-test
description: "Use when code, scripts, configs, or documentation tooling need graduated verification commands: syntax, import, smoke, functional, integration, or regression checks, with read-only reporting of failures."
---

# Run Test

Use this skill after implementation or before handoff when the task needs explicit verification. This is a verification skill, not a repair skill.

## Test Ladder

Choose the smallest credible ladder for the change:

1. **syntax**: parser, formatter dry check, config validation
2. **import**: module import, CLI help, dependency resolution
3. **smoke**: minimal command or tiny sample that exercises the changed path
4. **functional**: targeted unit/integration test or expected output check
5. **regression**: baseline comparison, metric check, experiment dry run, or reproducibility command

## Procedure

1. Identify what must be verified and why.
2. Run the least expensive command that can catch the likely failure.
3. Record exact commands, working directory, exit status, and important output.
4. Stop on the first blocking failure unless later read-only checks are needed to diagnose.
5. Route failures back to `execute-plan` or `debug-review`.

## Output

Return:

- commands run
- pass/fail status per command
- artifact/log paths
- blocking failure summary if any
- confidence level and remaining untested risk

## Guardrails

- Do not modify source files from this skill.
- Do not hide skipped tests. State why they were skipped.
- Do not equate a smoke pass with full correctness when broader behavior is affected.
