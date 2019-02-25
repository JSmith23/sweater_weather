require 'rails_helper'

describe 'DarkSky' do
  before(:each) do
    @forecast = ForecastFacade.new({location: "Denver, Co"})
    @geo = GeocodeService.new("Denver, Co").get_coordinates
    @dark = DarkskyService.new(@geo).get_forecast
  end

  describe "Forecast Facade" do
    it "get back weather forecast details", :vcr do
      expect(@forecast).to be_an_instance_of(ForecastFacade)
    end
  end

  it ".current_forecast", :vcr do
    data = @forecast.current_forecast
  end

  it ".hourly_forecast", :vcr do
    data = @forecast.hourly_forecast
    expect(data.count).to eq(49)
  end

  it ".daily_forecast", :vcr do
    data = @forecast.daily_forecast
    expect(data.count).to eq(8)

  end
end
