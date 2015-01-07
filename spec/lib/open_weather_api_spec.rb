require_relative '../spec_helper'

describe OpenWeatherApi do

  describe 'location initializing methods' do

    describe "#city" do

      it "sets the name of the city" do
        OpenWeatherApi.city("London").city.must_equal "London"
      end

      it "returns an instance of OpenWeatherApi::Location class" do
        OpenWeatherApi.city("London").must_be_instance_of OpenWeatherApi::Location
      end
    end

    describe "#city_id" do

      it "sets the city id" do
        OpenWeatherApi.city_id(12345).city_id.must_equal 12345
      end

      it "returns an instance of OpenWeatherApi::Location class" do
        OpenWeatherApi.city_id(12345).must_be_instance_of OpenWeatherApi::Location
      end
    end

    describe "#geolocate" do

      it "sets the lat" do
        OpenWeatherApi.geolocate(lat: 12.345, lng: 54.321).lat.must_equal 12.345
      end

      it "sets the lng" do
        OpenWeatherApi.geolocate(lat: 12.345, lng: 54.321).lng.must_equal 54.321
      end

      it "returns an instance of OpenWeatherApi::Location class" do
        OpenWeatherApi.geolocate(lat: 12.345, lng: 54.321).must_be_instance_of OpenWeatherApi::Location
      end

      it "accepts an object that responds to lat and lng" do
        class LatLng
          def lat
            12.345
          end
          def lng
            54.321
          end
        end

        location = OpenWeatherApi.geolocate(LatLng.new)
        location.lat.must_equal 12.345
        location.lng.must_equal 54.321
      end
    end
  end
end