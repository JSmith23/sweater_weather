require 'rails_helper'

describe 'Giphy Request' do
  def assert_image(json_image, expected_image)
    keys = [:url, :time, :summary]
    expect(json_image.slice(*keys)).to eq(expected_image.slice(*keys))
  end

  describe "Visit endpoint" do
    it "get back gif details", :vcr do
      get '/api/v1/gifs?location=denver,co'
      expect(response).to be_successful
      gifs = JSON.parse(response.body, symbolize_names: true)
      images = gifs[:data][:attributes][:images]

      assert_image(
        images[0],
        url: "https://giphy.com/gifs/sky-clouds-1uLQUtPLbJMQ0",
        time: "2013-06-25 18:57:00",
        summary: "partly cloudy sky GIF"
      )
      assert_image(
        images[1],
        url: "https://giphy.com/gifs/beach-clouds-aQ7kognlRPDzi",
        time: "2016-06-21 18:29:37",
        summary: "partly cloudy beach GIF"
      )
    end
  end
end
