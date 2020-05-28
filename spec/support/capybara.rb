# frozen_string_literal: true

require "capybara/rails"
require "capybara/rspec"
require "selenium-webdriver"
require "webdrivers"

Capybara.default_driver        = :selenium_chrome_headless
Capybara.javascript_driver     = :selenium_chrome_headless
Capybara.default_max_wait_time = 5
Capybara.server                = :puma, { Silent: true }

Capybara::Screenshot.register_driver(:selenium_chrome_headless) do |driver, path|
  driver.browser.save_screenshot(path)
end
