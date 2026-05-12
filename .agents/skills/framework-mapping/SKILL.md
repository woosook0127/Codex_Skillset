---
name: framework-mapping
description: "Use when an idea, paper, model change, dataset, or experiment must be mapped onto the current repository backend, launcher/spec path, preserved baseline policy, and thinnest executable implementation route."
---

# Framework Mapping

Use this after or alongside `repo-audit` to decide how a proposal fits the current codebase.

## Procedure

1. Read `AGENTS.md` and, when useful, `../company-workflow/references/workflow.md`.
2. Inspect the relevant entrypoint, config, model package, dataset, engine, and metric code.
3. Identify the closest existing backend or preserved baseline.
4. Decide whether the proposal needs:
   - config/spec only
   - a thin utility wrapper
   - a copied variant package
   - a new runtime adapter
   - rejection as unsupported
5. Call out missing artifacts, unsupported assumptions, and validation requirements.
6. Route to `experiment-design`, `experiment-feasibility`, `paper-intake`, or implementation.

## Output

- backend mapping note
- preserved baseline / copied variant recommendation
- exact files likely involved
- minimal validation path
- caveats and next owner

## Guardrails

- Preserve existing backend paths unless evidence shows a thinner path is impossible.
- Do not mutate preserved baselines for new experiments.
- Distinguish current repo behavior from proposed behavior.
