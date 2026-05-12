---
name: analyze-results
description: "Use when completed experiment outputs, logs, metrics, predictions, checkpoints, or run summaries need interpretation against hypotheses, baselines, artifacts, regressions, and scientific claim status."
---

# Analyze Results

Use this after runs exist. For final adversarial claim review, use `skeptic-review` after the first analysis.

## Procedure

1. Recover the intended hypothesis and comparison surface.
2. Gather metrics, logs, predictions, checkpoints, and analysis artifacts.
3. Compare against the baseline and against expected failure modes.
4. Separate headline gains from regressions.
5. Check missing artifacts and evaluator limitations.
6. Assign claim status: supported, partially supported, unsupported, or inconclusive.
7. For paper reproduction or baseline claims, include scientific closure vocabulary from `company-workflow`.

## Output

- metric summary
- baseline comparison
- regressions / failure cases
- artifact completeness
- claim status
- next experiments or required debug

## Guardrails

- Do not rely on a single metric.
- Do not treat operational success as scientific confirmation.
- Make incomplete result capture explicit.
