module OpenWeatherApi
  class Forecast
    def initialize(forecast)
      @forecast_hash = forecast.parsed_response
    end

    def [](key)
      @forecast_hash[key]
    end

    def method_missing(name, *args, &block)
      if @forecast_hash.respond_to? name
        @forecast_hash.send(name)
      elsif @forecast_hash.has_key?(name.to_s)
        @forecast_hash[name.to_s]
      else
        super
      end
    end
  end
end