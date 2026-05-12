---
name: supervisor-intake
description: "Use when a new human request must be turned into Codex-native company workflow state: TASK, routing decision, acceptance criteria, branch intent, next team, and file-based handoff without using OMX."
---

# Supervisor Intake

Use this skill to convert a request into durable, routable work. This is a coordination skill; do not implement the task unless the user also asked for execution and the scope is small.

## Inputs

- human request
- current repository state
- existing `company/` task documents if present
- project `AGENTS.md`
- shared company workflow reference: `../company-workflow/references/workflow.md`

## Procedure

1. State assumptions and define success criteria.
2. Classify the task: direct answer, research, paper intake, repo audit, experiment design, implementation planning, implementation execution, testing, debug, artifact audit, final audit, documentation, skillset maintenance, or mixed.
3. If durable state is needed, create or update a `TASK` document under the appropriate `company/<team>/...` folder. If `company/` is absent and the user did not ask to initialize it, produce the task packet in the response or ask before creating a full tree.
4. Assign the next owner:
   - research question -> `develop/research`
   - paper-to-experiment -> `develop/paper_reenact` or `develop/research`
   - code/model change -> `develop/model_dev`
   - implementation plan -> `implementation-plan`
   - implementation execution -> `execute-plan`
   - test verification -> `run-test`
   - verification -> `develop/debug`
   - artifact/document audit -> `artifact-audit`
   - final gate -> `audit`
5. Record branch intent only when code or experiment execution will happen.
6. Write a `HANDOFF` when another team/skill should continue.

## Output

Return:

- task classification
- acceptance criteria
- chosen next skill/team
- artifact path if a file was created
- blockers or questions that materially affect routing

## Guardrails

- Do not route executable work straight to audit.
- Do not create speculative branches or full company trees without need.
- Do not rely on chat memory when a durable task is needed.
