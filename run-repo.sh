#!/bin/sh
set -eu

if [ -n "${REPO_REF:-}" ]; then
    git clone --depth 1 --branch "$REPO_REF" -- "$REPO_URL" repo
else
    git clone --depth 1 -- "$REPO_URL" repo
fi
cd repo
git rev-parse HEAD
python -m pip install --no-cache-dir .
exec "$@"
