# frozen_string_literal: true

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { record: :once }
  c.configure_rspec_metadata!

  c.filter_sensitive_data('<FAKEWEATHERKEY>') { ENV['WEATHER_API_KEY'] }
end
