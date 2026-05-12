---
name: repo-audit
description: "Use when Codex must inspect the repository before architecture, refactor, experiment, automation, or model-work decisions; maps entry points, configs, datasets, engines, metrics, checkpoints, and reuse boundaries with file evidence."
---

# Repo Audit

Use this before proposing architecture or experiment work that depends on how the repo actually runs.

## Procedure

1. Read project `AGENTS.md`.
2. Start from `run.py` or the current entrypoint.
3. Trace config loading, model package dispatch, dataset construction, engine lifecycle, metrics, checkpoints, and artifact output.
4. Inspect only the model packages and utilities relevant to the user goal.
5. Separate:
   - current behavior
   - reusable components
   - hard-coded assumptions
   - missing adapters or unsupported tasks
6. End with the smallest safe boundary for the next step.

## Output

- current execution path
- relevant files with line references when useful
- reusable pieces
- blockers / fragile assumptions
- recommended next skill: `framework-mapping`, `experiment-design`, `run-experiment`, or implementation

## Guardrails

- Do not infer behavior without reading implementing files.
- Do not propose a rewrite when a thin mapping or adapter would work.
- If the repo has already been audited in the current turn and no new evidence is needed, reuse that evidence.
