require 'rails_helper'

describe "Visit login endpoint" do
  it "a user logs in", :vcr do
    user = User.create(email: "whatever@google.com", password: "counter", password_confirmation: "counter", api_key: SecureRandom.uuid)
    login_params = {email: "whatever@google.com", password: "counter"}
    post '/api/v1/session', params: login_params
    expect(response).to be_successful
    end

    it "a user fails to log in", :vcr do
      user = User.create(email: "whatever@google.com", password: "counter", password_confirmation: "counter", api_key: SecureRandom.uuid)
      login_params = {email: "whatever@google.com", password: "fail"}
      post '/api/v1/session', params: login_params
      expect(response.status).to eq(401)
      expect(response.body).to eq("Unable to login")
    end
  end

