#!/usr/bin/env bash
# One-time publish helper for the structured-notes skill repo.
# Usage:  ./publish.sh [repo-name]     (default repo name: structured-notes)
#
# Path A (easiest): install the GitHub CLI (https://cli.github.com), run `gh auth login`,
#                   then run this script — it creates the repo and pushes in one go.
# Path B (no gh):   create an empty repo on github.com first, then follow the printed steps.
set -euo pipefail

REPO_NAME="${1:-structured-notes}"

# If this copy isn't a git repo yet (e.g. unzipped without history), initialize it.
if [ ! -d .git ]; then
  echo "Initializing git repository..."
  git init -q
  git add -A
  git -c commit.gpgsign=false commit -q -m "Initial commit: structured-notes skill"
fi

if command -v gh >/dev/null 2>&1; then
  echo "Creating and pushing public repo '$REPO_NAME' via GitHub CLI..."
  gh repo create "$REPO_NAME" --public --source=. --remote=origin --push
  echo "Done. Repo URL:"
  gh repo view --json url -q .url
else
  echo "GitHub CLI (gh) not found — do it manually:"
  echo "  1) Create an EMPTY repo named '$REPO_NAME' at https://github.com/new"
  echo "     (do not add a README, license, or .gitignore — this repo already has them)."
  echo "  2) Then run, replacing <your-username>:"
  echo
  echo "     git branch -M main"
  echo "     git remote add origin https://github.com/<your-username>/$REPO_NAME.git"
  echo "     git push -u origin main"
fi
