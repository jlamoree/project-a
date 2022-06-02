#!/usr/bin/env bash

echo "Building the project..."

if [ -d "project-b" ]; then
  echo "The following files exist in project-b"
  for f in ls -1 "project-b"; do
    echo "$f"
  done
else
  echo "No such thing as project-b"
fi
