class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      fav = user.create_favorite(favorite_params)
      render json: {location: fav.location}, status: 201
    end
  end

  private

  def favorite_params
    params.permit(:location)
  end
end