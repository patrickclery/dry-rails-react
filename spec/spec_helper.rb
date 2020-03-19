# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)

require "support/capybara"
require "support/factory_bot"
require "support/faker"
require "support/rspec"
require "support/simplecov"
require "support/vcr"
require "support/webmock"
A