require 'rails_helper'

describe "Visit favorite endpoint" do
  it "a user is able to favorite a location", :vcr do
    user = User.create(email: "whatever@google.com", password: "counter", password_confirmation: "counter", api_key: SecureRandom.uuid)

    post '/api/v1/favorites', params: {location: "Denver, CO", api_key: user.api_key}
    expect(response).to be_successful
    expect(response.status).to eq(201)
    results = JSON.parse(response.body)
    expect(results['location']).to eq("denver, co")
  end

  it "does not allow to add favorite a location in case of wrong api key", :vcr do
    user = User.create(email: "whatever@google.com", password: "counter", password_confirmation: "counter", api_key: SecureRandom.uuid)
    post '/api/v1/favorites', params: {location: "Denver, CO", api_key: 'wrong api key'}
    expect(response.status).to eq(401)
    expect(response.body).to eq("Authorization Failed")
  end


  it "a user is able to list favorite locations", :vcr do
    user = User.create(email: "whatever@google.com", password: "counter", password_confirmation: "counter", api_key: SecureRandom.uuid)
    user.favorites.create(location: "Denver, Co")
    user.favorites.create(location: "Atlanta, Ga")
    user.favorites.create(location: "Chicago, Il")

    get '/api/v1/favorites', params: {api_key: user.api_key}

    expect(response).to be_successful
    favorites = JSON.parse(response.body)
    expect(favorites.count).to eq(3)
    expect(response.status).to eq(200)
  end

  it "a user is able to delete a favorite location", :vcr do
    user = User.create(email: "whatever@google.com", password: "counter", password_confirmation: "counter", api_key: SecureRandom.uuid)
    user.favorites.create(location: "Denver, Co".downcase)
    user.favorites.create(location: "Atlanta, Ga".downcase)
    user.favorites.create(location: "Chicago, Il".downcase)
    delete_fav = user.favorites.create(location: "Boston, Ma".downcase)
    expect(user.favorites.count).to eq(4)

    delete "/api/v1/favorites", params: {api_key: user.api_key, location: "Boston, Ma"}

    expect(response).to be_successful
    expect(user.favorites.count).to eq(3)
    expect(response.status).to eq(200)
  end

  it "a user is unable to delete a favorite location due to wrong api key", :vcr do
    user = User.create(email: "whatever@google.com", password: "counter", password_confirmation: "counter", api_key: SecureRandom.uuid)
    user.favorites.create(location: "Denver, Co".downcase)
    user.favorites.create(location: "Atlanta, Ga".downcase)
    user.favorites.create(location: "Chicago, Il".downcase)
    delete_fav = user.favorites.create(location: "Boston, Ma".downcase)

    delete "/api/v1/favorites", params: {api_key: nil, location: "Boston, Ma"}

    expect(response.status).to eq(401)
    expect(response.body).to eq("Authorization Failed")
  end
end

