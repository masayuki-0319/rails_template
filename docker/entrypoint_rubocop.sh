#!/usr/bin/env bash

docker-compose run --rm app bundle add rubocop-airbnb --group "development, test"
touch .rubocop.yml .rubocop_airbnb.yml

cat << EOF > ./.rubocop_airbnb.yml
inherit_from:
  - .rubocop_airbnb.yml
EOF

cat << EOF > ./.rubocop.yml
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
