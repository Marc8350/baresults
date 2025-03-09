#!/bin/bash

cd "/home/marc/Development/Bachelorarbeit/colliee_container/results"

git add .
if git diff-index --quiet HEAD --; then
  echo "No changes to commit"
else
  git commit -m "Update Excel files $(date)"
  git push origin main
fi