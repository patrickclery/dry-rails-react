require "vcr"
require "multi_json"

VCR.configure do |config|
  config.cassette_library_dir     = File.join(__dir__, "../cassettes/")
  config.default_cassette_options = { serialize_with:             :json,
                                      record:                     :once,
                                      allow_playback_repeats:     true,
                                      decode_compressed_response: true,
                                      preserve_exact_body_bytes:  false }
  config.before_record do |interaction|
    interaction.response.body.force_encoding('UTF-8')
  end
  config.allow_http_connections_when_no_cassette = true
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

