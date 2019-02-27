class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: BackgroundSerializer.new(BackgroundGenerator.new(params[:location]))
  end
end