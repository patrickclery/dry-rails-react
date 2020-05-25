# frozen_string_literal: true

require "webmock/rspec"
require "hashdiff" # Fix for webmock
require "billy/capybara/rspec"
require "capybara/rspec"
WebMock.enable!

RSpec.configuration do |config|
  config.around(:each, type: :feature) do |example|
    WebMock.allow_net_connect!
    example.run
    WebMock.disable_net_connect!(allow_localhost: true)
  end
end

Billy.configure do |c|
  c.cache         = true
  c.persist_cache = true
  c.cache_path    = 'spec/req_cache/'
end
Billy.proxy.reset_cache

def selenium_chrome_options(headless: false)
  ::Selenium::WebDriver::Chrome::Options.new.tap do |options|
    options.add_argument("--proxy-server=127.0.0.1:#{Capybara::Webmock.port_number}")

    # Prevents the proxy from killing Websockets
    options.add_argument("--proxy-bypass-list=127.0.0.1")

    options.headless! if headless
  end
end

Capybara.register_driver :selenium_chromedriver do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: selenium_chrome_options(headless: true),
  )
end