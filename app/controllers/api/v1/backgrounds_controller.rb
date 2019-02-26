class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: BackgroundSerializer.new(BackgroundGenerator.new(params[:location]).get_url)
  end
end