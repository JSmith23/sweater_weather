require 'rails_helper'

describe 'Giphy' do
  before(:each) do
    @location = [{high: 54.41, icon: "partly-cloudy-day", low: 23.76, precip: 0.11}]
    @forecast = GifGenerate.new(@location)
    @giphy = GiphyService.new(@location[0].icon)
  end

  describe "Giphy API" do
    it "get back weather forecast details" do
      expect(@giphy).to be_an_instance_of(GiphyService)
    end
  end

  it ".get_data", :vcr do
    gif = @giphy.get_data
    expect(gif.count).to eq(25)
  end
end
