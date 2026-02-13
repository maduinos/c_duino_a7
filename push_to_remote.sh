#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <remote-url> [branch]"
  echo "Example: $0 git@github.com:USER/REPO.git work"
  exit 1
fi

REMOTE_URL="$1"
BRANCH="${2:-$(git rev-parse --abbrev-ref HEAD)}"
REMOTE_NAME="origin"

if git remote get-url "$REMOTE_NAME" >/dev/null 2>&1; then
  git remote set-url "$REMOTE_NAME" "$REMOTE_URL"
else
  git remote add "$REMOTE_NAME" "$REMOTE_URL"
fi

git push -u "$REMOTE_NAME" "$BRANCH"
