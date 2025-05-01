#!/bin/bash
set -e

BRANCH="gh-pages"
REPO=$(git config --get remote.origin.url)
ROOT_DIR=$(git rev-parse --show-toplevel)
TMP_DIR="$ROOT_DIR/.gh-pages-tmp"

rm -rf "$TMP_DIR"
mkdir "$TMP_DIR"
git clone --depth 1 --no-checkout "$REPO" "$TMP_DIR"

cd "$TMP_DIR"
git checkout $BRANCH 2>/dev/null || git checkout --orphan $BRANCH
git rm -rf . > /dev/null 2>&1 || true

cp -r "$ROOT_DIR"/* .
echo > .nojekyll

git add .
git commit -m "Deploy $(date)" || echo "No changes to commit."
git push origin $BRANCH

cd "$ROOT_DIR"
rm -rf "$TMP_DIR"

echo "Deployed to GitHub Pages branch '$BRANCH'"
