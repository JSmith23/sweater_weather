require 'rails_helper'

describe 'GifGenerator' do
  before(:each) do
    @location = [{high: 54.41, icon: "partly-cloudy-day", low: 23.76, precip: 0.11}]
    @gifgenerate = GifGenerator.new(@location)
  end

  describe "GifGenerator" do
    it ".images", :vcr do
      gif = @gifgenerate.images
      expect(gif.count).to eq(25)
    end
  end

end
