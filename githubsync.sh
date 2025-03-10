#!/bin/bash

EXCEL_FILES_DIR="/home/marc/Development/Bachelorarbeit/colliee_container/results"
GIT_REPO_DIR="$(pwd)" # Current directory, where the git repo is.

while true; do
  # Copy the new excel files into the git repository.
  cp "$EXCEL_FILES_DIR"/* "$GIT_REPO_DIR"

  cd "$GIT_REPO_DIR"

  git add .
  if git diff-index --quiet HEAD --; then
    echo "No changes to commit"
    echo "success" # Added success message here, because no changes were committed.
  else
    git commit -m "Update Excel files $(date)"
    if [ $? -eq 0 ]; then # Check git commit success
      git push origin master
      if [ $? -eq 0 ]; then # Check git push success
          echo "success"
      else
          echo "git push failed"
      fi
    else
      echo "git commit failed"
    fi
  fi
  sleep 300 # 5 minutes
done
