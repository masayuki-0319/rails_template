# ==========================
# Reference
# https://railsguides.jp/rails_application_templates.html
# https://github.com/rails/rails/tree/master/railties/lib/rails/generators


# ==========================
# Dubug for this file
# $ gem install pry-byebug
# require 'pry-byebug'


# ==========================
# Setting helper methods
REPO_BASE_URL = "https://raw.githubusercontent.com/masayuki-0319/rails_template/master/"

def replace_myapp(file)
  gsub_file(file, /#{app_name}/, app_name, verbose: false)
end

def get_remote(file, dest = nil)
  remote_file = REPO_BASE_URL + file
  dest ||= file

  get(remote_file, dest, force: true)
  replace_myapp(dest)
end


# ==========================
# Gem settings

# --------------------------
## Debug & Test gems
gem_group :test, :development do
  gem "pry-rails"
  gem "pry-byebug"
  gem "bullet"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "database_rewinder"
  gem "spring-commands-rspec"
end

# --------------------------
# Favorite gems
gem "seed-fu"


# ==========================
# Database settings
case @builder.options.database
when "mysql"
  run "cat << EOF >> .env.dev
MYSQL_ROOT_PASSWORD=pass
EOF"
  get_remote('config/database.yml_mysql', 'config/database.yml')
when "postgresql"
  run "cat << EOF >> .env.dev
POSTGRES_USER=root
POSTGRES_PASSWORD=pass
EOF"
  get_remote('config/database.yml_postgresql', 'config/database.yml')
when "sqlite3"
else
end


# ==========================
# Application settings

# --------------------------
# Base setting
base_setting = <<-EOF
config.time_zone = "Asia/Tokyo"
config.active_record.default_timezone = :local
I18n.enforce_available_locales = false
config.i18n.default_locale = :ja
config.generators do |g|
  g.helper false
  g.stylesheets false
  g.javascripts false
  g.test_framework :rspec,
                    fixtures: true,
                    routing_specs: false,
                    view_specs: false,
                    helper_specs: false,
                    controller_specs: false,
                    request_specs: true
  g.fixture_replacement :factory_bot, dir: "spec/factories"
end
EOF
environment base_setting

# --------------------------
# Bullet setting
bullet_application_setting = <<-EOF
config.after_initialize do
  Bullet.enable = true
  Bullet.alert = true
  Bullet.bullet_logger = true
  Bullet.console = true
  Bullet.rails_logger = true
end
EOF
environment bullet_application_setting, env: "development"


# ==========================
# View settings
case ask("Choose View template:", limited_to: %w[slim halm erb none])
when "slim"
  gem "slim-rails"

  remove_file("app/views/layouts/application.html.erb")
  get_remote("app/views/layouts/application.html.slim")

  slim_application_setting = <<-EOF
config.generators.template_engine = :slim
EOF
  environment slim_application_setting
when "halm"
  # TODO: haml setting
  gem "haml-rails"
when ["erb", "none"]
  puts "INFO: Use default view template ( erb )."
end


# ==========================
# Test settings
# --------------------------
# Rubocop
gem_group :test, :development do
  case ask("Choose rubocop template:", limited_to: %w[plain airbnb onkcop none])
  when "plain"
    # Base gem (https://github.com/rubocop-hq/rubocop)
    gem "rubocop", require: false
  when "airbnb"
    # Airbnb specific analysis for RuboCop (https://github.com/airbnb/ruby/tree/master/rubocop-airbnb)
    gem "rubocop-airbnb", require: false

    run "cat << EOF >> ./.rubocop_airbnb.yml
require:
  - rubocop-airbnb
EOF"
    run "cat << EOF > ./.rubocop.yml
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
EOF"
  when "onkcop"
    # TODO: onkcop setting
    # Create by japanese programmer(https://github.com/onk/onkcop)
    gem "onkcop", require: false
  when "none"
    puts "INFO: No setting rubocop."
  end
end

# # --------------------------
# # RSpec
run "bundle install -j4"
generate "rspec:install"

run "rm -rf test"

run "cat << EOF > ./.rspec
--require spec_helper
--format documentation
EOF"

## For enable fast run rspec.
run "bundle exec spring binstub rspec"

## For enable ./spec/support
uncomment_lines "spec/rails_helper.rb", /Dir\[Rails\.root\.join/
run "cat << EOF > ./spec/support/factory_bot.rb
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
EOF"
run "cat << EOF > ./spec/support/database_rewinder.rb
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseRewinder.clean_all
    # or
    # DatabaseRewinder.clean_with :any_arg_that_would_be_actually_ignored_anyway
  end

  config.after(:each) do
    DatabaseRewinder.clean
  end
end
EOF"


# ==================================================
# Use if add file to gitignore
# run "cat << EOF >> .gitignore
# EOF"


# ==========================
if yes?("run migrate ?")
  rails_command "db:create"
  rails_command "db:migrate"
end
