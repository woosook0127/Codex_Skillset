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

## User-Facing Research Markdown Rules

- When the user is Korean or the existing research artifact is Korean, write the explanatory prose in Korean by default.
- Keep established technical terms, model names, method names, metric names, dataset names, and equations in their original English notation.
- Do not put mathematical formulas in plain text code blocks. Use Markdown LaTeX math (`$...$` or `$$...$$`) when the target viewer supports it.
- Use SVG equation assets only when the target Markdown viewer does not support LaTeX math or when the user explicitly requests image-based equations.
- Do not use LaTeX block math for simple hyperparameter sets, mode-specific windows, or notation legends. Use a Markdown table or Korean prose with inline code instead.
- Known viewer issue: inside LaTeX block math, if a newline's first visible component is an operator such as `=`, `+`, `-`, or `\\rightarrow`, some Markdown viewers render the block incorrectly. Keep the left-hand side and first operator on the same line, or use a stable aligned environment.
- Code blocks are for commands, config, code, tensor-flow sketches, or literal text only. If a block contains algebraic symbols such as summation, conjugate, tensor notation, or Greek letters, convert it to LaTeX math.
- Before finalizing a user-facing Markdown document, scan for English prose that should be Korean and for pseudo-equations that should be LaTeX.

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
