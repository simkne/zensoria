#!/usr/bin/env bash
# =============================================================================
# ORW500.NET / zensoria — bash command reference (copy-paste snippets)
# Repository: https://github.com/simkne/zensoria.git
# =============================================================================

REPO_ROOT="/Users/simon/orw500/projs/ORW500.NET"
cd "$REPO_ROOT" || exit 1


# =============================================================================
# Git — initialize and link remote (one-time)
# =============================================================================

git init
git branch -m main
git remote add origin https://github.com/simkne/zensoria.git
# git remote set-url origin https://github.com/simkne/zensoria.git  # if remote exists
git remote -v




# =============================================================================
# Git — first commit and push (when local and GitHub both have initial commits)
# =============================================================================

# If push is rejected (non-fast-forward): GitHub has a starter commit, local has
# a different root commit. Merge unrelated histories, then push:
git pull origin main --allow-unrelated-histories --no-rebase
# Resolve conflicts (keep local README.md and .gitignore), then:
git add README.md .gitignore
git commit -m "Merge GitHub initial commit with local zensoria structure."
git push -u origin main


# =============================================================================
# Git — first commit and push (fresh local repo, empty GitHub)
# =============================================================================

git pull origin main --allow-unrelated-histories --no-rebase

git add .
git status
git status --ignored | grep resources

git commit -m "$(cat <<'EOF'
Initial zensoria structure: agentix, openHAB_SiK, ZENSORIA, web_documentation.

resources/ is local-only (gitignored).
EOF
)"
git push -u origin main


# =============================================================================
# Git — branches
# =============================================================================

# Switch to dev (branch already exists locally)
git switch dev

# If dev exists on remote but not locally yet:
git fetch origin
git switch dev
# or: git switch -c dev origin/dev

# Switch back to main
git switch main

# Create dev from current branch (one-time, if not created yet)
# git switch -c dev
# git push -u origin dev


# =============================================================================
# Git — everyday
# =============================================================================

git status
git diff
git add path/to/file
git commit -m "message"
git push
git pull origin main


# =============================================================================
# Inspect structure
# =============================================================================

find . -maxdepth 3 -not -path './.git/*' -not -name '.DS_Store' \( -type d -o -type f \) | sort
ls -la resources/
ls -la ZENSORIA/mcs/
