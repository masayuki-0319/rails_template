#!/usr/bin/env bash
set -xe

docker-compose run --rm app bundle add rubocop-airbnb rubocop-performance --group "development, test"
touch .rubocop.yml .rubocop_airbnb.yml

cat << EOF > ./.rubocop_airbnb.yml
require:
  - rubocop-airbnb
EOF

cat << EOF > ./.rubocop.yml
require: rubocop-performance
inherit_from:
  - .rubocop_airbnb.yml
AllCops:
#  TargetRubyVersion:
#  TargetRailsVersion:

  Exclude:
    - 'bin/**/*'
    - 'config/**/*'
    - 'db/**/*'
    - 'lib/**/*'
    - 'node_modules/**/*'
    - 'spec/**/*'
    - 'vendor/**/*'
EOF

exec "$@"
