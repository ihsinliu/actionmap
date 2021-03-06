# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails'

if ENV['CI']
    require 'codecov'
    SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'cucumber/rails'
ActionController::Base.allow_rescue = false

begin
    DatabaseCleaner.strategy = :transaction
rescue NameError
    raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'
end

Cucumber::Rails::Database.javascript_strategy = :truncation
