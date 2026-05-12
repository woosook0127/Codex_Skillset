---
name: experiment-design
description: "Use when turning a user goal, paper packet, idea, or feasibility result into an executable experiment design: hypothesis, baseline, variant, ablations, metrics, artifacts, reproducibility metadata, and current-backend mapping."
---

# Experiment Design

Use this to create an executable experiment plan or spec. Do not run the experiment here.

## Procedure

1. Confirm repo mapping is known. If not, use `repo-audit` or `framework-mapping` first.
2. Define one primary hypothesis.
3. Define the protected comparison surface:
   - preserved baseline
   - copied variant package if code changes are required
   - dataset and split protocol
   - checkpoint selection rule
   - metric policy
4. Define baseline, ablations, and variants as explicit deltas.
5. Specify execution path: entrypoint, config/spec, model package, expected artifact root.
6. Specify smoke validation before large runs.
7. Mark unsupported metrics, data, or runtime assumptions honestly.

## Output

- experiment proposal or spec
- baseline / variant / ablation plan
- metrics and artifacts
- reproducibility metadata
- smoke validation plan
- blockers and next owner

## Guardrails

- A design without a baseline is incomplete.
- A design that cannot map to current code must say `unsupported` or `adapter required`.
- Do not mutate preserved baselines in place.
