require 'capybara/rails'
require 'webdrivers'
require 'selenium-webdriver'
require 'capybara-screenshot/rspec'

Capybara.default_driver = :selenium_chrome_headless
Capybara.default_max_wait_time = 5
Capybara.server = :puma, { Silent: true }
Capybara.javascript_driver = :selenium_chrome_headless

Capybara::Screenshot.register_driver(:selenium_chrome_headless) do |driver, path|
  driver.browser.save_screenshot(path)
end
