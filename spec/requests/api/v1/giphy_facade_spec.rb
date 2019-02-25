require 'rails_helper'

describe 'Giphy Request' do
  before(:each) do
    @location = {location: "Denver, Co"}
    @forecast = ForecastFacade.new(@location)
    @geo = GeocodeService.new(@location).get_coordinates
    @dark = DarkskyService.new(@geo).get_forecast
    @giphy = GiphyService.new(@location).get_data
  end

  describe "Visit endpoint" do
    it "get back gif details", :vcr do
      binding.pry
      get '/api/v1/gifs?location=denver,co'
      expect(response).to be_successful
    end
  end


end
