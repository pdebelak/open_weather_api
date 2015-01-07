require_relative '../spec_helper'

describe "OpenWeatherApi#configure" do

  before do
    OpenWeatherApi.configure do |config|
      config.app_id = 12345
    end
  end

  it 'must set the app id for a new location' do
    loc = OpenWeatherApi.city_id(524901)
    loc.app_id.must_equal 12345
  end
end