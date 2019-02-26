require 'rails_helper'

describe "Visit login endpoint" do
  it "a user logs in", :vcr do
    user_params = {email: "whatever@google.com", password: "counter", password_confirmation: "counter"}
    post '/api/v1/users', params: {user: user_params}

    expect(response).to be_successful
    user = User.last
    expect(user.email).to eq(user_params[:email])

    login_params = {email: "whatever@google.com", password: "counter"}
    post '/api/v1/session', params: {session: login_params}
    expect(response).to be_successful
    end
  end

