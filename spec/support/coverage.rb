# frozen_string_literal: true

require "simplecov"
SimpleCov.start "rails"

require "codecov"
### Support for CodeCov
SimpleCov.formatter = SimpleCov::Formatter::Codecov

