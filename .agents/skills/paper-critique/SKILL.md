---
name: paper-critique
description: "Use when a paper claim, reproduction plan, or paper-derived experiment needs skeptical review for weak baselines, unfair comparisons, leakage, missing ablations, under-specified protocol, or overclaimed gains."
---

# Paper Critique

Use this to challenge claims before they become experiment or writing decisions.

## Procedure

1. Identify the exact claim and benchmark surface.
2. Check baseline fairness, data split, tuning symmetry, metric choice, and evaluation protocol.
3. Look for leakage, future context, private data, post-processing, or missing negative cases.
4. Check whether the claim can be tested in this repo or requires unsupported runtime/data.
5. State which claims are acceptable, weakened, blocked, or need more evidence.

## Output

- blocked or weakened claims
- missing baselines / ablations
- fairness and leakage risks
- reproduction ambiguities
- required follow-up evidence

## Guardrails

- Focus on validity, not prose quality.
- Treat unclear data handling as a real risk.
- Do not accept a single headline metric without protocol evidence.
