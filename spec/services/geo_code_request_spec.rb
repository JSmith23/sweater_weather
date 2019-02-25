require 'rails_helper'

describe 'Geo' do
  before(:each) do
    data = {location: "Chicago, Illinois"}
    @geo_code = GeocodeService.new(data)
  end

  describe "GeoCode API" do
    it "gets longitude and latitude of a location" do
      expect(@geo_code).to be_an_instance_of(GeocodeService)
    end

    it ".get_data", :vcr do
      data = @geo_code.get_data

      expect(data).to have_key(:results)
      expect(data).to have_key(:status)
    end

    it ".get_coordinates", :vcr do
      data = @geo_code.get_coordinates
      expect(data).to eq({lat:41.8781136, lng:-87.6297982})
    end
  end
end
