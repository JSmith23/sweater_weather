require 'rails_helper'

describe "Visit endpoint" do
  it "create a user", :vcr do
    user_params = {email: "whatever@google.com", password: "counter", password_confirmation: "counter"}
    post '/api/v1/users', params: {user: user_params}

    user = User.last
    expect(response).to be_successful
    expect(user.email).to eq(user_params[:email])
    end
  end

