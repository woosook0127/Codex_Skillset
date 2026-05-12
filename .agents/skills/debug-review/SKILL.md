---
name: debug-review
description: "Use when develop output needs a blocking Codex-native debug quality gate: reproduce or smoke-test the claimed change, inspect logs/artifacts, verify branch/provenance when relevant, and issue PASS, PASS_WITH_WARNINGS, FAIL, or URGENT_BLOCKER."
---

# Debug Review

Use this before audit or before declaring implementation ready.

## Procedure

1. Read the task, result, handoff, and changed files.
2. Verify git state when code changes are involved.
3. Run the smallest meaningful validation path:
   - syntax/import checks for code
   - smoke test for model/runtime changes
   - targeted command from the plan when available
4. Compare claimed behavior against observed evidence.
5. Record exact commands, outputs, artifacts, and unresolved gaps.
6. Return one outcome: `PASS`, `PASS_WITH_WARNINGS`, `FAIL`, or `URGENT_BLOCKER`.

## Output

- debug outcome
- validation commands and results
- evidence paths
- issues and owner
- next action

## Guardrails

- Do not add unrelated feature work.
- Raise `URGENT_BLOCKER` for integrity, baseline, or unsafe-execution issues.
- Do not treat skipped validation as a pass.
