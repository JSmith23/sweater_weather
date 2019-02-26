require 'rails_helper'

describe "Visit endpoint" do
  it "create a user", :vcr do

    expect(User.count).to eq(0)
    user_params = {email: "whatever@google.com", password: "counter", password_confirmation: "counter"}
    post '/api/v1/users', params: user_params
    user = User.last
    expect(response).to be_successful

    expect(User.count).to eq(1)
    expect(user).to have_attribute(:api_key)
    expect(user.api_key).to be_a(String)
    end
  end

