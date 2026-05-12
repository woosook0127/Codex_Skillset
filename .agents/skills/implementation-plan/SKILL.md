---
name: implementation-plan
description: "Use when a code, model, automation, or documentation change needs an explicit Codex-native implementation plan with assumptions, target files, acceptance criteria, and verification before execution."
---

# Implementation Plan

Use this skill before non-trivial edits or when the user asks for a plan. It merges the useful parts of initial planning and plan refinement into one Codex-native workflow.

## Procedure

1. Restate the goal and success criteria.
2. Inspect only the files, configs, notes, or plans needed to make a grounded plan.
3. State assumptions, risks, and open questions. Ask only when a reasonable assumption would be risky.
4. Define the implementation surface:
   - files or modules likely to change
   - files that should remain untouched
   - baseline or artifact preservation constraints
5. Define verification:
   - syntax/import check
   - unit or smoke test
   - functional test
   - experiment command or dry run when relevant
6. If refining an existing plan, preserve accepted parts and list exactly what changed.

## Output Shape

```text
Goal:
Scope:
Assumptions:
Plan:
1. ...
2. ...
Verification:
Risks:
Next skill: execute-plan / run-test / supervisor-intake / direct execution
```

## Guardrails

- Do not implement from this skill unless the user explicitly requested plan-and-execute and the plan is small.
- Keep plans surgical. Avoid speculative abstractions, broad refactors, and unrequested flexibility.
- If code or experiment work spans multiple handoffs, route through `supervisor-intake` or `company-workflow`.
