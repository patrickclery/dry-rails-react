# frozen_string_literal: true

require "support/coverage"

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)

require "support/capybara"
require "support/factory_bot"
require "support/faker"
require "support/rspec"
require "support/database_cleaner"
require "support/shoulda"
require "support/webmock"
