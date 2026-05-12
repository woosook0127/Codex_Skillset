---
name: experiment-feasibility
description: "Use when a proposed experiment needs a grounded GO, CONDITIONAL, or NO_GO decision covering backend fit, baseline preservation, data availability, compute burden, metric support, and validation path."
---

# Experiment Feasibility

Use this before implementation or long training.

## Procedure

1. Read the idea/proposal/spec and current repo constraints.
2. Confirm backend mapping and baseline/copy strategy.
3. Check data availability and path-binding assumptions.
4. Check metric/evaluator availability and trust.
5. Estimate compute/runtime burden at a practical level.
6. Define the smallest smoke path that would reduce risk.
7. Return one decision: `GO`, `CONDITIONAL`, or `NO_GO`.

## Output

- feasibility summary
- technical fit
- operational risks
- missing evidence
- recommended next team/skill
- exact condition for moving forward if conditional

## Guardrails

- Do not hide missing runtime support.
- Do not collapse feasibility into implementation.
- Long training, dataset binding, and external credentials remain human-supervised.
