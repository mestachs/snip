#!/bin/bash
set -e

BUILD_DIR="."
BRANCH="gh-pages"
REPO=$(git config --get remote.origin.url)

if [ ! -d "$BUILD_DIR" ]; then
  echo "Build directory '$BUILD_DIR' not found."
  exit 1
fi

TMP_DIR=$(mktemp -d)

git clone --branch $BRANCH --depth 1 $REPO $TMP_DIR || git clone --depth 1 $REPO $TMP_DIR
cd $TMP_DIR

git checkout $BRANCH 2>/dev/null || git checkout --orphan $BRANCH
git rm -rf . > /dev/null 2>&1 || true
cp -r ../$BUILD_DIR/* .
touch .nojekyll

git add .
git commit -m "Deploy $(date)" || echo "No changes to commit."
git push origin $BRANCH

cd -
rm -rf $TMP_DIR

echo "Deployed to GitHub Pages branch '$BRANCH'"
