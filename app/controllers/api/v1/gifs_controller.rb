class Api::V1::GifsController < ApplicationController
  def show
    render json: GifGenerator.new(params[:location]).images
  end
end