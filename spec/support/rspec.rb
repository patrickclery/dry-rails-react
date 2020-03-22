# frozen_string_literal: true

require "rspec/rails"
RSpec.configure do |config|
  config.order = :random
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.use_transactional_fixtures = true
  config.example_status_persistence_file_path = ".rspec_status"
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!
end

# Shared contexts and behaviors
Dir['./spec/{contexts,behaviors}/**.rb'].each do |f|
  require f.sub(%r|\./spec/|, '')
end
