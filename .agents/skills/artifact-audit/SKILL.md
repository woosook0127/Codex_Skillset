---
name: artifact-audit
description: "Use for read-only audit of research notes, paper cards, plans, reports, drafts, and workflow artifacts for factual support, structure, cross-reference integrity, coverage gaps, and readiness before handoff."
---

# Artifact Audit

Use this skill when the object to inspect is a written artifact rather than the code/runtime result itself. This complements `debug-review` and `audit-review`: it checks the quality of evidence documents, not whether code works or whether a branch is promotion-ready.

## Inputs

- research knowledge bases and paper cards
- company `TASK`, `HANDOFF`, `RESULT`, or `AUDIT` documents
- experiment plans and result summaries
- document drafts, proposals, reports, reviews, or rebuttals
- project analysis artifacts

## Procedure

1. Define the artifact type and audit scope.
2. Inspect the referenced files only; keep the audit read-only unless the user explicitly asks for fixes.
3. Check:
   - factual claims have source paths, paper notes, commands, logs, or metrics
   - structure matches the artifact's purpose
   - cross-references point to existing files or clearly named external sources
   - missing sections or TODOs would block handoff
   - conclusions are not stronger than the evidence
   - research cards include method, setup, metrics, main numbers, limitations, and relationship to prior work
4. Classify issues by severity: blocking, major, minor, or note.
5. Recommend the smallest correction path or next skill.

## Output

Return:

- `ARTIFACT_AUDIT_PASS`, `ARTIFACT_AUDIT_PASS_WITH_WARNINGS`, or `ARTIFACT_AUDIT_FAIL`
- findings ordered by severity
- file/path references
- missing evidence
- recommended next action

## Guardrails

- Do not rewrite artifacts unless explicitly asked.
- Do not duplicate `audit-review`; use that for final branch/result promotion.
- Do not treat a well-written report as proof that the underlying experiment is valid. Route to `skeptic-review` or `audit-review` when scientific or merge claims are at stake.
