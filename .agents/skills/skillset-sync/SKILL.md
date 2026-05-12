---
name: skillset-sync
description: "Use when Codex must validate, synchronize, document, commit, or push the user's Codex skillset repository and keep project-local skill copies aligned without Claude/Notion-specific tooling."
---

# Skillset Sync

Use this skill for maintaining the Codex skillset itself. It adapts the useful dashboard/sync idea from Claude settings into a Git-backed Codex workflow.

## Source Of Truth

Default canonical repository:

```text
/home/wooseok/project/Codex_Skillset
```

Project-local consumers usually copy:

```text
.agents/
AGENTS.md
```

## Procedure

1. Identify the canonical repo and the consuming project.
2. Validate every `.agents/skills/*/SKILL.md`:
   - YAML frontmatter exists
   - only `name` and `description` are required
   - `name` matches the directory name unless there is an intentional reason
   - description states when to use the skill
3. Check for broken symlinks and accidental `.omx/` or `.codex/agents/*.toml` coupling.
4. Update `README.md` when skill inventory, routing, or workflows change.
5. Use `git diff --check` and inspect `git status`.
6. Commit and push only when the user requested Git management or the task clearly includes it.
7. Sync to a consuming project by copying `.agents/` and `AGENTS.md` after canonical validation.

## Guardrails

- Do not use Notion, Claude slash commands, or OMX as part of the default sync path.
- Do not overwrite project-specific skill edits without checking the diff.
- Do not push unvalidated skill frontmatter.
