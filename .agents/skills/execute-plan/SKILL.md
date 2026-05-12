---
name: execute-plan
description: "Use to carry out an approved or clearly implied implementation plan with surgical edits, progress tracking, baseline preservation, and handoff to verification."
---

# Execute Plan

Use this skill when there is a concrete implementation plan or a small enough user request that the plan is implicit. This skill owns the edit loop, not final validation claims.

## Procedure

1. Read the current plan, request, or task artifact.
2. Check the working tree before editing. Do not revert unrelated user changes.
3. Implement the smallest change that satisfies the success criteria.
4. Match existing style and ownership boundaries.
5. Update only artifacts required by the change.
6. Keep an execution log in the response or the task artifact when durable state is active.
7. Hand off to `run-test`, `debug-review`, or direct verification depending on risk.

## Editing Rules

- Use `apply_patch` for manual file edits.
- Do not create broad abstractions for single-use behavior.
- Do not improve adjacent code unless required to make the requested change work.
- Preserve baselines, checkpoints, logs, and experiment specs unless the user asks to replace them.

## Output

Include:

- changed files
- decisions made during execution
- verification performed or next verification command
- blockers or residual risks

## Guardrails

- Do not claim the change is complete without an appropriate verification path.
- Do not use this skill for literature synthesis or final audit.
- If execution reveals the plan is wrong, stop and revise via `implementation-plan` or route through `supervisor-intake`.
