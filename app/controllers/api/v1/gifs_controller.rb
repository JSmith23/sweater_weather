class Api::V1::GifsController < ApplicationController
  def show
    daily_forecast = ForecastGenerator.new(params[:location]).daily_forecast
    render json: GiphySerializer.new(GifGenerator.new(daily_forecast).images)
  end
end