require 'rails_helper'

describe 'Giphy Request' do
  before(:each) do
    daily = ForecastGenerator.new("Denver, Co").daily_forecast
    @gifger = GifGenerator.new(daily).images
  end

  describe "Visit endpoint" do
    it "get back gif details", :vcr do
      get '/api/v1/gifs?location=denver,co'
      expect(response).to be_successful
      # gifs = JSON.parse(response.body, symbolize_names: true)
      # expect(gifs[:data][:attributes][:images].count).to eq(25)
    end
  end


end
