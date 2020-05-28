# frozen_string_literal: true

require "billy/capybara/rspec"
require "table_print"

##############################################################################
# Add `billy: true` to your test to stub AJAX with Billy
##############################################################################
RSpec.configure do |config|
  config.around(:each, billy: true) do |example|
    ##############################################################################
    # From the puffing-billy docs:
    # If you use VCR and Webmock elsewhere in your specs, you may need to disable
    # them for your specs utilizing Puffing Billy.
    ##############################################################################
    WebMock.allow_net_connect!
    old_driver                 = Capybara.default_driver
    old_javascript_driver      = Capybara.javascript_driver
    Capybara.default_driver    = :selenium_chrome_headless_billy
    Capybara.javascript_driver = :selenium_chrome_headless_billy

    example.run
    puts "Requests received via Puffing Billy Proxy:"
    puts TablePrint::Printer.table_print(Billy.proxy.requests, [
      :status,
      :handler,
      :method,
      { url: { width: 100 } },
      :headers,
      :body
    ])

    # Put everything back
    Capybara.default_driver = old_driver
    Capybara.javascript_driver = old_javascript_driver
    webmock_options = {
      allow_localhost: true,
      allow:           "chromedriver.storage.googleapis.com"
    }
    WebMock.disable_net_connect!(**webmock_options)
  end
end

Billy.configure do |c|
  c.cache      = true
  c.cache_path = 'spec/req_cache/'
  c.cache_request_body_methods
  c.cache_request_headers             = false
  c.ignore_cache_port                 = true # defaults to true
  c.non_successful_cache_disabled     = false
  c.non_whitelisted_requests_disabled = false
  c.persist_cache                     = true
  c.record_requests                   = true
  c.record_stub_requests              = true
end
Billy.proxy.reset_cache
