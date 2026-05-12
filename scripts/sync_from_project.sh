#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <project-root>" >&2
  exit 2
fi

project_root="$(cd "$1" && pwd)"
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ ! -f "$project_root/AGENTS.md" ]]; then
  echo "Missing $project_root/AGENTS.md" >&2
  exit 1
fi

if [[ ! -d "$project_root/.agents" ]]; then
  echo "Missing $project_root/.agents" >&2
  exit 1
fi

rsync -a --delete "$project_root/.agents/" "$repo_root/.agents/"
cp "$project_root/AGENTS.md" "$repo_root/AGENTS.md"

broken="$(find "$repo_root/.agents" -type l ! -exec test -e {} \; -print)"
if [[ -n "$broken" ]]; then
  echo "Broken symlinks found after sync:" >&2
  echo "$broken" >&2
  exit 1
fi

echo "Synced AGENTS.md and .agents from $project_root"
