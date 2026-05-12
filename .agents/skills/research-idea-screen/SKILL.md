---
name: research-idea-screen
description: "Use when a research idea or hypothesis must be screened against literature, current repo overlap, existing baselines/runs/specs, novelty risks, comparison papers, and minimum credible experiment direction before coding."
---

# Research Idea Screen

Use this before implementation when the user is testing a research direction.

## Procedure

1. Restate the idea as a falsifiable hypothesis.
2. Search local project knowledge first:
   - `research_knowledge/`
   - existing paper cards and Q&A
   - experiment specs, results, runs, model packages
3. If literature evidence is insufficient, invoke `literature-field-surveyor` or run a targeted paper search.
4. Identify the strongest comparison papers and baselines.
5. Map the idea to current repo capability with `framework-mapping` when needed.
6. Recommend: proceed, refine, defer, or drop.

## Output

- `IDEA`-style packet if durable state is needed
- repo overlap check
- literature signals and comparison papers
- minimum credible baseline comparison
- proposed next skill/team

## Guardrails

- Research is not a default coding team.
- Novelty claims require both literature and repo-overlap evidence.
- If evidence is weak, label the recommendation as provisional.
