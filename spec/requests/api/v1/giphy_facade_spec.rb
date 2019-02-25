require 'rails_helper'

describe 'Giphy Request' do
  before(:each) do
    @location = {location: "Denver, Co"}
    @gifger = GifGenerator.new(@location).get_gifs
  end

  describe "Visit endpoint" do
    it "get back gif details", :vcr do
      get '/api/v1/gifs?location=denver,co'
      binding.pry
      expect(response).to be_successful
    end
  end


end
