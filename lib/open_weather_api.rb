require "httparty"
Dir[File.dirname(__FILE__) + '/open_weather_api/*.rb'].each do |file|
  require file
end
