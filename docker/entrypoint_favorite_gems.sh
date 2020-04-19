#!/usr/bin/env bash
set -xe

docker-compose run --rm app bundle add pry-byebug pry-rails --group "development, test"

exec "$@"
