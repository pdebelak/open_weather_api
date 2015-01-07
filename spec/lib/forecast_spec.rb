require_relative '../spec_helper'

describe OpenWeatherApi::Forecast do

  let(:forecast) { OpenWeatherApi.city_id(524901).forecast(daily: true) }

  before do
    VCR.insert_cassette 'forecast', :record => :new_episodes
  end
 
  after do
    VCR.eject_cassette
  end

  it 'must act like a hash' do
    forecast.keys.must_be_instance_of Array
    forecast.keys.include?('city').must_equal true
  end

  it 'must have methods for each hash key' do
    forecast.city['name'].must_equal 'Moscow'
  end
end