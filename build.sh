#!/usr/bin/env bash

echo "Building the project..."

if [ -d "project-b" ]; then
  echo "The following files exist in project-b"
  ls -lR "project-b"
else
  echo "No such thing as project-b"
fi
