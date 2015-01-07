require_relative '../lib/open_weather_api'

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/openweathermap_cassettes'
  c.hook_into :webmock
end