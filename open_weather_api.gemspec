# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open_weather_api/version'

Gem::Specification.new do |spec|
  spec.name          = "open_weather_api"
  spec.version       = OpenWeatherApi::VERSION
  spec.authors       = ["Peter Debelak"]
  spec.email         = ["pdebelak@gmail.com"]
  spec.summary       = %q{Gem to wrap http://openweathermap.org/api}
  spec.description   = %q{Gem to wrap http://openweathermap.org/api}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"

  spec.add_dependency "httparty"
end
