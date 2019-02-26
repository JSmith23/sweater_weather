class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user.api_key = SecureRandom.uuid
      response = {"api_key" => "#{user.api_key}"}
      render json: response, status: 201
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end