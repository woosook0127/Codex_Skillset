---
name: skeptic-review
description: "Use when final experiment conclusions, result analyses, reproduction claims, or paper-derived claims need a disciplined skeptical pass for unfair baselines, leakage, tuning asymmetry, ignored regressions, and missing evidence."
---

# Skeptic Review

Use this as the final challenge pass before a claim is accepted or communicated.

## Procedure

1. Identify the conclusion being claimed.
2. Check whether the strongest available baseline was used.
3. Check fairness: data, split, checkpoint, tuning, metric, and compute symmetry.
4. Check leakage, future context, contamination, or hidden post-processing.
5. Check whether regressions outside the headline metric were ignored.
6. Decide whether the claim should be accepted, weakened, deferred, or blocked.

## Output

- accepted / weakened / deferred / blocked claims
- missing evidence
- fairness or leakage concerns
- required follow-up experiments
- suggested wording if the claim must be caveated

## Guardrails

- Default to challenging weak conclusions.
- Missing baseline evidence is a blocker.
- Do not let one metric override obvious methodological issues.
