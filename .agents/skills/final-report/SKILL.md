---
name: final-report
description: "Use at the end of a planned task to produce a concise final report from the request, plan, edits, tests, artifacts, residual risks, and next actions."
---

# Final Report

Use this skill when a task produced enough work that the user needs a durable or structured completion report. This is especially useful after `implementation-plan -> execute-plan -> run-test` or after a multi-step research/experiment workflow.

## Inputs

- original request
- plan or task artifact
- changed files or generated artifacts
- test commands and outputs
- result analysis, debug review, or audit findings when present

## Report Contents

Include:

- what changed
- why it changed
- files or artifact paths
- verification performed
- key evidence or metrics
- residual risks and skipped checks
- recommended next action

## Output Modes

- **chat summary**: use for small tasks.
- **durable report**: write under the active task/report folder when company workflow is active or the user requests a report.

## Guardrails

- Do not overclaim. Report only what was verified.
- Do not bury failures below a change summary.
- Do not restate every command output; summarize the evidence that matters.
