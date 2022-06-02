#!/usr/bin/env bash

# Ensure that all the sub-projects exist

for subproject in project-b project-c project-d; do
  if [ ! -d "$subproject" ]; then
    >&2 echo "Error: Missing project-b"
    exit 1
  fi
done

echo "Tests passed!"
exit 0
