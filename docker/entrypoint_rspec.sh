
```ruby:spec/rails_helper.rb
...
Dir[Rails.root.join("spec", "support", "**", "*.rb")].each {|f| require f }
...
```

cat << EOF > ./spec/support/factory_bot.rb
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
EOF


cat << EOF > ./.rspec
--require spec_helper
--format documentation
EOF

cat << EOF > ./spec/support/database_rewinder.rb
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
EOF
