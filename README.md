# Codex Skillset

Project-local Codex skill harness for research, experiment planning, verification, and audit workflows.

This repository intentionally stores **Codex-native skills**, not OMX team runtime state.

## Contents

- `AGENTS.md`: baseline behavior rules for projects that consume this skillset.
- `.agents/skills/`: project-local Codex skills.
- `.agents/skills/literature-field-surveyor/`: paper-grounded literature survey, paper cards, synthesis, and Q&A.
- `.agents/skills/company-workflow/`: durable company-style file workflow without OMX.
- `scripts/sync_from_project.sh`: copy `AGENTS.md` and `.agents/` from a project into this repo.

## Use In A Project

Copy or symlink these files into the target project root:

```bash
rsync -a .agents/ /path/to/project/.agents/
cp AGENTS.md /path/to/project/AGENTS.md
```

Codex should then treat `.agents/skills/*/SKILL.md` as the project workflow layer.

## Operating Rule

Use these skills directly in Codex. Do not invoke `omx`, `omx team`, tmux workers, `.codex/agents/*.toml`, or `.omx/state` unless the user explicitly asks to operate OMX.
