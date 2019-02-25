require 'rails_helper'

describe 'DarkSky' do
  before(:each) do
    @location = "Denver, CO"
    @gifgenerate = GifGenerator.new(@location)
  end

  describe "GifGenerator" do
    it "gif images", :vcr do
      expect(@forecast).to be_an_instance_of(ForecastFacade)
    end
  end

end
