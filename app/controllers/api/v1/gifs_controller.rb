class Api::V1::GifsController < ApplicationController
  def show
    render json: GiphySerializer.new(GifGenerator.new(params[:location]).get_gifs)
  end
end