require 'rails_helper'

describe 'GifGenerator' do
  before(:each) do
    @location = 'denver,co'
    @daily_objects = ForecastGenerator.new(@location)
    @gifgenerate = GifGenerator.new(@location)
  end

  describe "GifGenerator" do
    it ".images", :vcr do
      gif = @gifgenerate.images
      expect(gif.count).to eq(200)
    end
  end

end
