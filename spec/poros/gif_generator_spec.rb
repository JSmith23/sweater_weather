require 'rails_helper'

describe 'GifGenerator' do
  before(:each) do
    @location = "Denver, CO"
    @gifgenerate = GifGenerator.new(@location)
  end

  describe "GifGenerator" do
    it ".images", :vcr do
      gif = @gifgenerate.images

      expect(gif.count).to eq(25)
    end
  end

end
