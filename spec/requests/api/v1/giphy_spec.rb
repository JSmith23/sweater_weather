require 'rails_helper'

describe 'Giphy Request' do
  before(:each) do
    @location = {location: "Denver, Co"}
    @gifger = GifGenerator.new(@location).images
  end

  describe "Visit endpoint" do
    it "get back gif details", :vcr do
      get '/api/v1/gifs?location=denver,co'
      expect(response).to be_successful
    end
  end


end
