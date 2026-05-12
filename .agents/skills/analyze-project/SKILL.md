---
name: analyze-project
description: "Use before substantial code, paper, or document work when Codex must map the given materials, detect the task mode, gather evidence, and produce a concise project analysis artifact before planning or execution."
---

# Analyze Project

Use this skill when the user asks to understand a project, paper packet, document set, or mixed materials before deciding what to do. This is a pre-work analysis skill, not an implementation skill.

## Modes

Pick the narrowest mode that fits:

- **code**: repository structure, entry points, configs, tests, datasets, metrics, and likely modification surfaces. Prefer `repo-audit` for deep repository mapping.
- **paper**: paper, citation, PDF, or paper notes. Prefer `paper-intake` for reproduction packets and `literature-field-surveyor` for field survey.
- **document**: existing drafts, reports, proposals, reviews, or notes. Continue with `document-workflow` when drafting or refinement is needed.
- **mixed**: combine the above, but keep outputs separated by evidence type.

## Workflow

1. State the detected mode and assumptions.
2. Inventory only the materials needed for the user goal.
3. Record evidence with paths, paper titles, URLs, commands, or note filenames.
4. Identify the smallest next workflow: direct answer, `repo-audit`, `paper-intake`, `literature-field-surveyor`, `document-workflow`, `implementation-plan`, or `supervisor-intake`.
5. If durable state is useful, write an analysis artifact under:

```text
project_analysis/<mode>/<YYYY-MM-DD>_<short_slug>.md
```

## Output Shape

Include:

- goal and scope
- material inventory
- relevant evidence
- unknowns and risks
- recommended next skill or direct next action
- what was intentionally not inspected

## Guardrails

- Do not implement code changes from this skill.
- Do not turn a narrow question into a broad audit.
- Do not rely on chat memory when a durable handoff is needed.
- Keep paper and field claims traceable to local paper notes or source papers.
