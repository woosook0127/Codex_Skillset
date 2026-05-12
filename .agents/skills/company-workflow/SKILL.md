---
name: company-workflow
description: "Use when Codex must operate the user's company-style durable workflow without OMX: supervisor routing, research/develop/debug/audit team state, file-based handoffs, task documents, quality gates, baseline preservation, scientific closure, and Codex-native skill orchestration."
---

# Company Workflow

Use this as the shared operating layer for the project-local company harness. This is a **Codex-native file workflow**, not an OMX team runtime.

## Core Rule

Do not invoke `omx`, `omx team`, tmux worker panes, `.codex/agents/*.toml`, or `.omx/state` as the execution mechanism unless the user explicitly asks to operate OMX. Use:

- project `AGENTS.md` for baseline behavior
- `.agents/skills/*/SKILL.md` for task-specific workflows
- durable Markdown files under `company/` when task state or handoff matters
- Codex native subagents only when the user explicitly asks for multi-agent work or when the main task clearly requested delegation

## Company Layout

Expected mutable state, when initialized in a consuming repo:

```text
company/
  supervisor/{inbox,active,waiting,done,status}/
  develop/
    research/{inbox,active,waiting,done,status}/
    model_dev/{inbox,active,waiting,done,status}/
    paper_reenact/{inbox,active,waiting,done,status}/
    debug/{inbox,active,waiting,done,status}/
  audit/{inbox,active,waiting,done,status}/
  shared/{templates,policies,registry}/
```

If `company/` is absent, do not invent hidden state. Either create only the specific artifact the user requested, or ask before initializing a full company tree.

## Workflow

1. **Supervisor intake**: normalize the human request into `TASK`, route to the right team, and record branch/task decisions when they matter.
2. **Research / design / develop**: produce the smallest durable packet needed for the next owner. Research does not default to code.
3. **Debug gate**: verify the smallest realistic executable path before audit.
4. **Audit gate**: independently review pushed branch/provenance/evidence before promotion.
5. **Supervisor closure**: summarize operational status and, for experiments or paper reproduction, scientific closure.

## Routing

- Literature survey, paper cards, field Q&A: use `literature-field-surveyor`.
- Paper-to-experiment packet: use `paper-intake`.
- New idea novelty / baseline comparison screen: use `research-idea-screen`.
- Repo mapping before design: use `framework-mapping` or `repo-audit`.
- Experiment proposal: use `experiment-design`.
- Feasibility decision before implementation: use `experiment-feasibility`.
- Run execution from a ready spec: use `run-experiment`.
- Result interpretation: use `analyze-results`, then `skeptic-review` for final claims.
- Gate verification: use `debug-review`, then `audit-review`.

## Required Evidence

Every durable artifact should include:

- objective or claim
- scope / out-of-scope
- evidence paths, commands, logs, papers, specs, or runs
- blockers and next action
- git state when code or experiment execution is involved
- explicit caveats when scientific interpretation is partial

See [workflow.md](references/workflow.md) for templates, policy vocabulary, and closure rules.
