require 'webmock/rspec'
require 'hashdiff' # Fix for webmock

WebMock.enable!
WebMock.allow_net_connect!
