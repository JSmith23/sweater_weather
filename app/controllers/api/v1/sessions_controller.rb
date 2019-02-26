class Api::V1::SessionsController < ApplicationController

  def create
    binding.pry
    if user = User.authenticate(session[:email], session[:password])
      session[:user_id] = user.id
      response = {api_key: "#{user.api_key}"}
      render json: response, status: 201
    else
      render json: "Unable to login", status: 401
    end
  end

  private

  def login_params
    params.require(:session).permit(:email, :password)
  end

end