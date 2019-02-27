require 'rails_helper'

describe 'BackgroundGenerator' do
  before(:each) do
    @location = "Denver, Co"
    @bgenerate = BackgroundGenerator.new(@location)
  end

  describe "BackgroundGenerate" do
    it "proves its an instance", :vcr do
      expect(@bgenerate).to be_an_instance_of(BackgroundGenerator)
    end

    it ".get_url", :vcr do
      image = @bgenerate.get_url

      expect(image).to eq("https://farm8.staticflickr.com/7861/32285623767_b8ec9048a0.jpg")
    end
  end

end
