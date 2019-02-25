class Api::V1::GifsController < ApplicationController
  def show
    daily = ForecastGenerator.new(params[:location]).daily_forecast
    render json: GifGenerator.new(daily).get_images
  end
end