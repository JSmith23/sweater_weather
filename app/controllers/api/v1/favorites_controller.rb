class Api::V1::FavoritesController < ApplicationController

  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: FavoriteGenerator.new(user).favorites_list
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      fav = user.create_favorite(favorite_params)
      render json: {location: fav.location}, status: 201
    end
  end

  def destroy
    user = User.find_by(api_key: params[:api_key])
    if user
      fav = user.favorites.find_by(location: params[:location])
      fav.destroy
      # render json: "Deleted", status: 204
    else
      render json: "Error", status: 404
    end
  end


  private

  def favorite_params
    params.permit(:location, :api_key)
  end
end