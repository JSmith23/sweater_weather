require 'rails_helper'

describe 'Geo' do
  before(:each) do
    @geo_code = GeocodeService.new("Chicago, Illinois")
  end

  describe "GeoCode API" do
    it "gets longitude and latitude of a location" do
      expect(@geo_code).to be_an_instance_of(GeocodeService)
    end
  end
end
