---
name: document-workflow
description: "Use for Codex-native document strategy, drafting, and refinement for reports, proposals, paper notes, rebuttals, reviews, documentation, and presentation scripts using local materials and versioned edits."
---

# Document Workflow

Use this skill when the main deliverable is a written document rather than code, experiment execution, or literature database maintenance.

## Modes

- **strategy**: decide audience, purpose, outline, evidence, and acceptance criteria.
- **draft**: write or complete the document from approved materials.
- **refine**: revise an existing document from feedback, review comments, memos, or changed evidence.
- **audit handoff**: send to `artifact-audit` when factual support, coverage, or structure must be checked.

## Procedure

1. Identify document type, audience, goal, language, and expected format.
2. Gather only relevant local materials: paper cards, experiment reports, logs, existing drafts, or user notes.
3. Create or update a short strategy before long drafting when the document is non-trivial.
4. Draft in Markdown unless the repository already uses another format.
5. When refining an existing document:
   - preserve the original unless direct editing was requested
   - summarize feedback applied
   - keep claims traceable to evidence
6. For research documents, route factual uncertainty to `literature-field-surveyor`, `paper-intake`, `analyze-results`, or `skeptic-review`.

## Output

Include:

- document path when a file was created or edited
- evidence sources used
- unresolved claims or missing evidence
- recommended audit or review step

## Guardrails

- Do not invent citations or experiment results.
- Do not use marketing structure for technical research documents unless requested.
- Do not replace `literature-field-surveyor` paper cards; use that skill when paper-card format is required.
