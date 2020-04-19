#!/usr/bin/env bash
set -xe

rm -rf .git
git init
git add .
git commit -m "first commit"

exec "$@"
