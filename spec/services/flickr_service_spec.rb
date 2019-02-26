require 'rails_helper'

describe 'Flickr' do
  before(:each) do
    @tag = "Dog"
    @flickr = FlickrService.new(@tag)
  end

  describe "Flickr API" do
    it "get back weather forecast details" do
      expect(@flickr).to be_an_instance_of(FlickrService)
    end
  end

  it ".get_image", :vcr do
    flick = @flickr.get_image
  end
end
