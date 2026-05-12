---
name: audit-review
description: "Use when work needs final independent audit for policy compliance, provenance, baseline preservation, artifact completeness, result credibility, merge/promotion readiness, or caveated AUDIT_PASS/AUDIT_FAIL decision."
---

# Audit Review

Use this after debug review, not as a substitute for implementation or debugging.

## Preconditions

- Debug outcome exists or the user explicitly asks for a read-only audit of current state.
- For promotion/merge readiness, audit a pushed branch head. If the workspace is uncommitted, report that as a caveat or blocker.

## Procedure

1. Read the task, handoff, result, debug report, and relevant policies.
2. Verify provenance: branch, commit head, push status, changed files.
3. Verify baseline preservation and scoped implementation.
4. Verify artifact completeness and evidence behind the claimed result.
5. Check unresolved issues, skipped tests, and scientific closure if relevant.
6. Return one outcome: `AUDIT_PASS`, `AUDIT_PASS_WITH_CAVEATS`, or `AUDIT_FAIL`.

## Output

- audit scope
- evidence reviewed
- findings by severity
- audit outcome
- caveats and promotion recommendation

## Guardrails

- Do not take over implementation ownership.
- Do not approve work without evidence.
- Do not erase caveats to make a task look complete.
