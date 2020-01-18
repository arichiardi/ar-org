#!/usr/bin/env bash
# Commit with timestamp

set -euo pipefail

echo "Commit files"

datetime=$(date --iso-8601=second)
message="Commit on $datetime"
git add . # this is also adding new files
git commit -m "$message"
