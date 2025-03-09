#!/bin/bash

EXCEL_FILES_DIR="/home/marc/Development/Bachelorarbeit/colliee_container/results" # Replace with your actual path
GIT_REPO_DIR="$(pwd)" # Current directory, where the git repo is.

# Copy the new excel files into the git repository.
cp "$EXCEL_FILES_DIR"/* "$GIT_REPO_DIR"

cd "$GIT_REPO_DIR"

git add .
if git diff-index --quiet HEAD --; then
  echo "No changes to commit"
else
  git commit -m "Update Excel files $(date)"
  git push origin master
fi