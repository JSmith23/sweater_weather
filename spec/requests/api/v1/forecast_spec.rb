require 'rails_helper'

describe 'Forecast Request' do
  before(:each) do
    @location = {location: "Denver, Co"}
    @forecast = ForecastFacade.new(@location)
    @geo = GeocodeService.new(@location).get_coordinates
    @dark = DarkskyService.new(@geo).get_forecast
  end

  describe "Visit endpoint" do
    it "get back weather forecast details", :vcr do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful
    end
  end


end
