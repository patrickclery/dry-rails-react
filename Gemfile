# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.6.5"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap"
gem "brakeman"
gem "json", "~> 2.3.0"
gem "fast_jsonapi"
gem "pg"
gem "puma"
gem "rails", "~> 6.0.2.2"
gem "react-rails"
gem "turbolinks"
gem "webpacker", "~> 5.x"

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "codecov"
  gem "database_cleaner"
  gem "factory_bot"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec"
  gem "rspec-core"
  gem "rspec-rails", "~> 4.0.0" # Needed for react-rails controller tests
  gem "rails-controller-testing"
  gem "rubocop"
  gem "rubocop-rspec"
  gem "selenium-webdriver"
  gem "shoulda"
  gem "simplecov"
  gem "vcr"
  gem "webdrivers"
  gem "webmock"
end
