# References
# https://railsguides.jp/rails_application_templates.html

# TODO: リモートからテンプレートをダウンロード
# def get_remote(file_path)
#   repo_base_url = "https://raw.githubusercontent.com/masayuki-0319/rails_template/master/"
#   remote_file = repo_base_url + file_path

#   get(remote_file, dest, force: true)
#   replace_myapp(dest)
# end

# gem settings
#

# Base
gem "seed_fu"

gem_group :test, :development do
  # debug
  gem "pry-rails"
  gem "pry-byebug"
  gem "bullet"
  # testing
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "database_rewinder"
  gem "spring-commands-rspec"
end


# Database settings
# TODO: .env.dev に環境変数追加
# TODO: リモートの database.yml と置換
case @builder.options.database
when "mysql"
when "postgresql"
when "sqlite3"
else
end


# Application settings
#
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
                     request_specs: true,
    g.fixture_replacement :factory_bot, dir: "spec/factories"
  end
  EOF
environment base_setting

# View settings
case ask("Choose View template:", limited_to: %w[slim halm erb none])
when "slim"
  gem "slim-rails"
  remove_file "app/views/layouts/application.html.erb"
  # get "#{repo_url}/app/views/layouts/application.html.slim", "app/views/layouts/application.html.slim"
  slim_application_setting = <<-EOF
  config.generators.template_engine = :slim
  EOF

  environment slim_application_setting
when "halm"
  # TODO: haml_setting
  gem "haml-rails"
when ["erb", "none"]
  puts "No change view template"
end

# bullet_setting
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


# Test settings
## Rubocop
gem_group :test, :development do
  case ask("Choose rubocop template:", limited_to: %w[Plain Airbnb Onkcop None])
  when "Plain"
    # Base for other templates. (https://github.com/rubocop-hq/rubocop)
    gem "rubocop", require: false
  when "Airbnb"
    # Airbnb specific analysis for RuboCop. (https://github.com/airbnb/ruby/tree/master/rubocop-airbnb)
    gem "rubocop-airbnb", require: false
  when "Onkcop"
    # Set by japanese programmer(https://github.com/onk/onkcop)
    gem "onkcop", require: false
  when "None"
  end
end

if gems["rubocop-airbnb"]
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
      - "bin/**/*"
      - "config/**/*"
      - "db/**/*"
      - "lib/**/*"
      - "node_modules/**/*"
      - "spec/**/*"
      - "vendor/**/*"
  EOF"
# TODO: onkcop setting
end

# RSpec
generate "rspec:install"

run "rm -rf test"

run "cat << EOF > ./.rspec
--require spec_helper
--format documentation
EOF"

## For fast run rspec.
run "bundle exec spring binstub rspec"

## For enabled ./spec/support
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

# after_bundle do
#   git :init
#   git add: "."
#   git commit: %Q{ -m "Initial commit" }
# end

# setting .gitignore
# ==================================================
# gitignore = <<-EOF
# vendor/bundler
# vendor/bundle
# coverage
# config/database.yml
# public/uploads
# .rubocop.yml
# .DS_Store
# Gemfile.lock.tags
# tags
# EOF
# File.open(".gitignore", "a") do |file|
#   file.write gitignore
# end

if yes?("run migrate ?")
  rails_command "db:create"
  rails_command "db:migrate"
  # TODO: Rails version for < 4.x
end
