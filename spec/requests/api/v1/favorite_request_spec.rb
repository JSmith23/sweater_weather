require 'rails_helper'

describe "Visit favorite endpoint" do
  it "a user is able to favorite a location", :vcr do
      user = User.create(email: "whatever@google.com", password: "counter", password_confirmation: "counter", api_key: SecureRandom.uuid)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      post '/api/v1/favorites', params: {location: "Denver, CO", api_key: user.api_key}
      expect(response).to be_successful
      expect(response.status).to eq(201)
      results = JSON.parse(response.body)
      expect(results['location']).to eq("denver, co")
    end

    it "a user is able to list favorite locations", :vcr do
      user = User.create(email: "whatever@google.com", password: "counter", password_confirmation: "counter", api_key: SecureRandom.uuid)
      user.favorites.create(location: "Denver, Co")
      user.favorites.create(location: "Atlanta, Ga")
      user.favorites.create(location: "Chicago, Il")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get '/api/v1/favorites', params: {api_key: user.api_key}

      expect(response).to be_successful
      favorites = JSON.parse(response.body)
      expect(favorites.count).to eq(3)
      expect(response.status).to eq(200)
    end

    it "a user is able to delete a favorite location", :vcr do
      user = User.create(email: "whatever@google.com", password: "counter", password_confirmation: "counter", api_key: SecureRandom.uuid)
      user.favorites.create(location: "Denver, Co")
      user.favorites.create(location: "Atlanta, Ga")
      user.favorites.create(location: "Chicago, Il")
      delete_fav = user.favorites.create(location: "Boston, Ma")
      expect(user.favorites.count).to eq(4)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      delete "/api/v1/favorites/#{delete_fav.id}", params: {api_key: user.api_key, location: "Boston, Ma"}

      expect(response).to be_successful
      expect(user.favorites.count).to eq(3)
      expect(response.status).to eq(204)
    end
  end

