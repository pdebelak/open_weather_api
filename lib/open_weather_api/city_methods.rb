module OpenWeatherApi
  def self.city(city)
    Location.new(city: city)
  end

  def self.city_id(city_id)
    Location.new(city_id: city_id)
  end

  def self.geolocate(args)
    lat = args.respond_to?(:lat) ? args.lat : args[:lat]
    lng = args.respond_to?(:lng) ? args.lng : args[:lng]
    Location.new(lat: lat, lng: lng)
  end
end