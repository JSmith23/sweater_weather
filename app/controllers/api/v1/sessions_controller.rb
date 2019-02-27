class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      response = {api_key: user.api_key}
      render json: response, status: 200
    else
      render json: "Unable to login", status: 401
    end
  end
end