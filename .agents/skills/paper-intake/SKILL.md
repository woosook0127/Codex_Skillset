---
name: paper-intake
description: "Use when a paper, citation, PDF, excerpt, or note set must be converted into a repo-grounded research or reproduction packet: executable claims, datasets, architecture, training recipe, evaluation protocol, ambiguities, and next experiment path."
---

# Paper Intake

Use this for paper-to-repo translation. For broad field survey or paper cards, use `literature-field-surveyor`; for skeptical validity review, use `paper-critique`.

## Procedure

1. Identify the paper and obtain reliable source text. Browse when the paper content is not already local.
2. Extract executable claims:
   - problem and task
   - input/output
   - architecture and loss
   - training data and recipe
   - evaluation datasets, metrics, baselines, and ablations
3. Map the claims onto current repo capabilities using `framework-mapping` or targeted file inspection.
4. Identify ambiguities that block faithful reproduction.
5. Decide next owner:
   - missing literature context -> `literature-field-surveyor`
   - executable design -> `experiment-design`
   - feasibility risk -> `experiment-feasibility`
   - critical validity concerns -> `paper-critique`

## Output

- problem statement
- core claims worth testing
- required data / preprocessing
- model and training requirements
- evaluation protocol and baselines
- repo mapping or explicit unsupported runtime gap
- unresolved ambiguities

## Guardrails

- Do not produce vague summaries.
- Do not claim repo compatibility without mapping to actual files or backends.
- Keep quotations short and only when needed for exact claims.
