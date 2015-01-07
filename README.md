# open-weather-map

A gem wrapper for the [OpenWeatherMap API](http://openweathermap.org/api).

## Installation

Add this line to your application's Gemfile:

    gem 'open_weather_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install open_weather_api

## Usage

	# get 3 hour forecast for London
	OpenWeatherApi.city("London").forecast

	# get current weather for city with id = 524901
	OpenWeatherApi.city_id(524901).current

	# get 16 days of forecast in metric (not imperial) units
	OpenWeatherApi.geolocate(lat: 45.321, lng: 34201).forecast(daily: true, units: "metric") 

	# gets 14 days of forecast instead of 16 - note that #geolocate can take an object that responds to #lat and #lng methods
	OpenWeatherApi.geolocate(ObjectThatRespondsToLatAndLngMethods).forecast(daily: true, count: 14)

These methods will return an object (either `OpenWeatherApi::Forecast` or `OpenWeatherApi::Current`) that contains the JSON response parsed to a ruby hash. The objects act like a hash and also have methods for each key in the top level of the hash if that is more convenient. See the [specs](https://github.com/pdebelak/open_weather_api/tree/master/spec/lib) for a few examples.

### App Id:

	# sends your app id with requests
	OpenWeatherApi.configure do |config|
	  config.app_id = 12345
	end

## Contributing

1. Fork it ( https://github.com/pdebelak/open_weather_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

I welcome contributions or feature requests. Open an issue if there is a feature you'd like to see.
