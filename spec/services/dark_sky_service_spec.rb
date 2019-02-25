require 'rails_helper'

describe 'DarkSky' do
  before(:each) do
    @coords = {"lat":39.7392358, "lng":-104.990251}
    @dark_sky = DarkskyService.new(@coords)
  end

  describe "DarkSky API" do
    it "get back weather forecast details" do
      expect(@dark_sky).to be_an_instance_of(DarkskyService)
    end
  end

  it ".get_forecast", :vcr do
    data = @dark_sky.get_forecast

    expect(data).to have_key(:currently)
    expect(data).to have_key(:hourly)
    expect(data).to have_key(:daily)
  end
end
