class Api::V1::GifsController < ApplicationController
  def show
    generator = GifGenerator.new(params[:location])
    render json: GiphySerializer.new(generator)
  end
end