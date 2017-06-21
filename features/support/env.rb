require 'cucumber/rails'
require 'database_cleaner'
require 'coveralls'

Coveralls.wear_merged!('rails')

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

World(FactoryGirl::Syntax::Methods)

Before do
  Aws.config[:s3] = {stub_responses: true}
end
