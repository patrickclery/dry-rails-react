# frozen_string_literal: true

require "capybara/rspec"
require "hashdiff" # Fix for webmock
require "webmock/rspec"

##############################################################################
# WebMock is on by default, and can be disabled by adding `webmock: false`
# e.g:
#   it 'should do something', webmock: false { ... }

WebMock.enable!
webmock_options = {
  allow_localhost: true,
  allow:           "chromedriver.storage.googleapis.com"
}
WebMock.disable_net_connect!(**webmock_options)

RSpec.configure do |config|
  config.around(:each, webmock: false) do |example|
    WebMock.allow_net_connect!
    example.run
    WebMock.disable_net_connect!(**webmock_options)
  end
end
