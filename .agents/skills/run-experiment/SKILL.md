---
name: run-experiment
description: "Use when a canonical or clearly defined experiment spec is ready to execute locally: resolve backend/config, record exact command, run least-invasive train/eval command, capture logs/artifacts, and report status or failure diagnostics."
---

# Run Experiment

Use this only when the spec or command is sufficiently defined.

## Procedure

1. Confirm the spec maps to real files, backend package, config, data, and mode.
2. Confirm expected metrics and artifacts are supported by the current backend.
3. Record the resolved command before execution.
4. For risky or long jobs, run the smallest smoke path first.
5. Execute the command with bounded logging.
6. Capture logs, checkpoints, metrics, predictions, and artifact roots.
7. Report status: success, failed, timeout, interrupted, or blocked.

## Output

- exact command
- resolved config/backend
- artifact paths
- run status
- failure diagnostics if applicable
- next recommended analysis or debug step

## Guardrails

- Do not change source code just to make a run work.
- Do not hide failed or partial runs.
- Do not start large training when data paths, compute budget, or user approval are unclear.
