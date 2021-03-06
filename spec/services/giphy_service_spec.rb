require 'rails_helper'

describe 'Giphy' do
  before(:each) do
    @icon = "partly-cloudy-day"
    @giphy = GiphyService.new(@icon)
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
