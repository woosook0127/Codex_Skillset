# Company Workflow Reference

## Teams

- `supervisor`: intake, routing, branch/task ownership, final synthesis.
- `develop/research`: literature, repo-overlap, idea screening, experiment proposals, feasibility packets.
- `develop/model_dev`: code/model changes, copied variants, backend-local implementation.
- `develop/paper_reenact`: paper reproduction packets and paper-faithful execution planning.
- `develop/debug`: blocking quality gate before audit.
- `audit`: final independent verification before merge or promotion.

## Standard Documents

Use these document types when a task needs durable state:

- `TASK`: objective, scope, acceptance criteria, constraints, related artifacts.
- `PLAN`: approach, steps, validation plan, exit criteria.
- `HANDOFF`: sender, receiver, requested action, changed artifacts, risks, required verification.
- `RESULT`: completed work, validation, outputs, scientific closure, remaining gaps.
- `ISSUES`: severity, evidence, impact, owner, unblock condition.
- `AUDIT`: branch/evidence reviewed, findings, outcome, caveats.
- `DECISION`: chosen path, context, alternatives, consequences, rollback trigger.
- `IDEA`: problem, repo overlap, literature signals, candidate direction, next team.
- `EXPERIMENT_PROPOSAL`: hypothesis, baseline/variant, dataset/metrics, execution path, risks.
- `FEASIBILITY`: GO / CONDITIONAL / NO_GO, technical fit, operational risk, evidence, next step.
- `HYPOTHESIS_CONTRACT`: one primary hypothesis, exact change set, constants held fixed, success/falsification.

## Frontmatter Fields

Prefer this common metadata shape:

```yaml
task_id: "<task_id>"
doc_type: "TASK|PLAN|HANDOFF|RESULT|ISSUES|AUDIT|DECISION|IDEA|EXPERIMENT_PROPOSAL|FEASIBILITY|HYPOTHESIS_CONTRACT"
owner: "<owner>"
team: "<team>"
status: "inbox|active|waiting|done|failed"
priority: "P0|P1|P2|P3"
blockers: []
next_action: "<next_action>"
dependencies: []
base_branch: "<base_branch-or-n/a>"
working_branch: "<working_branch-or-n/a>"
commit_head: "<commit-or-n/a>"
push_status: "pushed|not_pushed|not_applicable"
updated_at: "YYYY-MM-DD"
related_paths: []
related_runs: []
```

For `RESULT` from paper reproduction or experiments, add scientific closure fields:

```yaml
scientific_status: "SCIENTIFICALLY_CONFIRMED|SCIENTIFICALLY_PARTIAL|SCIENTIFICALLY_DEFERRED|SCIENTIFICALLY_BLOCKED"
reason_code: "NO_BLOCKER|PROTOCOL_MISMATCH|METRIC_POLICY_UNRESOLVED|INTERNAL_EVALUATOR_UNTRUSTED|DATASET_BINDING_AMBIGUOUS|CHECKPOINT_SELECTION_AMBIGUOUS|RESOURCE_LIMITED|TRAINING_INCOMPLETE|REPRODUCTION_GAP_UNEXPLAINED|EXTERNAL_REPO_AMBIGUITY"
scientific_decision_usable: false
can_advance_next_baseline: false
can_use_in_baseline_table: "no|with_caveat|yes"
scientific_summary_path: ""
```

## Policies

- Do not work directly on `main` for real implementation tasks.
- Do not route executable work directly to audit.
- Do not edit preserved baseline packages for new experiments. Copy to a variant package when model-package changes are required.
- Debug gate verifies the smallest realistic executable path and returns `PASS`, `PASS_WITH_WARNINGS`, `FAIL`, or `URGENT_BLOCKER`.
- Audit gate reviews a pushed branch head and returns `AUDIT_PASS`, `AUDIT_PASS_WITH_CAVEATS`, or `AUDIT_FAIL`.
- Operational completion is not scientific closure. A run can be operationally done but scientifically partial, deferred, or blocked.
- Dataset path binding, large training, external credentials, and promotion decisions remain human-supervised.

## Completion Semantics

A task is not complete until the relevant artifact states:

- what was done
- what was verified
- what evidence supports the claim
- what remains unresolved
- who owns the next action
- whether the conclusion is operational, scientific, or both
