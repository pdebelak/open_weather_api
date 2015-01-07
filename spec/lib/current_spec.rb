require_relative '../spec_helper'

describe OpenWeatherApi::Current do

  let(:current) { OpenWeatherApi.city_id(524901).current }

  before do
    VCR.insert_cassette 'current', :record => :new_episodes
  end
 
  after do
    VCR.eject_cassette
  end

  it 'must act like a hash' do
    current.keys.must_be_instance_of Array
    current.keys.include?('name').must_equal true
  end

  it 'must have methods for each hash key' do
    current.name.must_equal 'Moscow'
  end
end