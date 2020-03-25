# frozen_string_literal: true

require "webmock/rspec"
require "hashdiff" # Fix for webmock

WebMock.enable!
WebMock.disable_net_connect!
