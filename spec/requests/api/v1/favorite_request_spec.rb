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
  end

