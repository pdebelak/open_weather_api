require_relative '../spec_helper'

describe OpenWeatherApi::Location do
  
  describe "default attributes" do

    it "must include httparty methods" do
      OpenWeatherApi::Location.must_include HTTParty
    end

    it "must have the base url set to the Open Weather Map api endpoint" do
      OpenWeatherApi::Location.base_uri.must_equal 'http://api.openweathermap.org/data/2.5'
    end
  end

  describe 'forecast' do
    let(:loc) { OpenWeatherApi.city_id(524901) }

    before do
      VCR.insert_cassette 'forecast', :record => :new_episodes
    end
   
    after do
      VCR.eject_cassette
    end

    it 'must have a forecast method' do
      loc.must_respond_to :forecast
    end

    it 'must parse the api response to OpenWeatherApi::Forecast' do
      loc.forecast.must_be_instance_of OpenWeatherApi::Forecast
    end

    it 'must perform the request and get the data' do
      loc.forecast['city']['name'].must_equal 'Moscow'
    end
  end
end