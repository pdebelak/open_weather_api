require_relative 'city_methods'

module OpenWeatherApi

  class Location
    include HTTParty
    attr_reader :city, :city_id, :lat, :lng, :app_id
    
    base_uri 'http://api.openweathermap.org/data/2.5'

    def initialize(args)
      @city = args[:city]
      @city_id = args[:city_id]
      @lat = args[:lat]
      @lng = args[:lng]
      @app_id = OpenWeatherApi.configuration.app_id
    end

    def forecast(options={})
      defaults = {
        daily: false,
        units: 'imperial',
        count: 16
      }
      options = defaults.merge(options)
      forecast = get_forecast(options)
      OpenWeatherApi::Forecast.new(forecast)
    end

    def current
      current = make_request("/weather?#{location_query}")
      OpenWeatherApi::Current.new(current)
    end

    private

      def get_forecast(options)
        options[:daily] ? daily_forecast(options) : three_hour_forecast(options)
      end

      def daily_forecast(options)
        make_request("/forecast/daily?#{location_query}&cnt=#{options[:count]}&units=#{options[:units]}")
      end

      def three_hour_forecast(options)
        make_request("/forecast?#{location_query}&units=#{options[:units]}")
      end

      def location_query
        return "id=#{city_id}" if city_id
        return "q=#{city}" if city
        return "lat=#{lat}&lon=#{lng}" if lat && lng
      end

      def make_request(url)
        self.class.get(add_app_id(url))
      end

      def add_app_id(url)
        return url unless app_id
        url + "&APPID=#{app_id}"
      end
  end
end