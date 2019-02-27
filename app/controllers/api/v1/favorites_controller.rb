class Api::V1::FavoritesController < ApplicationController
  before_action :authenticate_user

  def index
    render json: FavoriteGenerator.new(current_user).favorites_list
  end

  def create
    fav = current_user.create_favorite(favorite_params)
    render json: {location: fav.location}, status: 201
  end

  def destroy
    fav = current_user.favorites.find_by(location: params[:location])
    fav.destroy
  end

  private

  def favorite_params
    params.permit(:location, :api_key)
  end
end