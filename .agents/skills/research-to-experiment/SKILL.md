---
name: research-to-experiment
description: "Use when a research workflow must connect paper reading, field gap analysis, idea formation, repo mapping, experiment design, execution, testing, result analysis, and skeptical closure."
---

# Research To Experiment

Use this skill for the user's full research loop: new paper or field -> weaknesses and gaps -> idea -> executable experiment -> test -> claim status. This is an orchestration skill, not a replacement for the narrower skills.

## Default Chain

Use the narrowest useful prefix of this chain:

```text
literature-field-surveyor
-> paper-intake
-> paper-critique
-> research-idea-screen
-> repo-audit / framework-mapping
-> experiment-design
-> experiment-feasibility
-> run-experiment / run-test
-> analyze-results
-> skeptic-review
-> debug-review / audit-review
```

## Procedure

1. Define the research question as a falsifiable goal.
2. Build or update paper evidence before making field-level claims.
3. Identify the target paper's strengths, weaknesses, missing baselines, and field context.
4. Convert the gap into one or more hypotheses.
5. Map the hypothesis to the current repository and preserved baselines.
6. Design the minimum credible experiment and ablations.
7. Decide `GO`, `CONDITIONAL`, or `NO_GO` before heavy execution.
8. Run only the agreed or least-invasive checks first.
9. Analyze results against the hypothesis and baselines.
10. Apply skeptical and audit gates before treating the result as a research conclusion.

## Subagent Use

Use Codex native subagents only when the user explicitly requested multi-agent work or when the task naturally splits into independent lanes, such as:

- literature comparison search
- repository mapping
- metric/baseline audit
- experiment command feasibility

The main Codex instance must integrate the outputs and own the final recommendation.

## Guardrails

- Do not skip from paper reading straight to implementation when novelty or baseline risk is unresolved.
- Do not treat a successful run as evidence of a scientific claim without `analyze-results` and `skeptic-review`.
- Do not create durable company state unless handoff, branch intent, or long-running work requires it.
