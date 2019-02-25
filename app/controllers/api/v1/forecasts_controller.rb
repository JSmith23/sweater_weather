class Api::V1::ForecastsController < ApplicationController
  def show
    # current = ForecastFacade.new(params).current_forecast
    # daily =   ForecastFacade.new(params).daily_forecast
    # hourly =  ForecastFacade.new(params).hourly_forecast
    # render json: {current: current, daily: daily, hourly: hourly}
    render json: ForecastSerializer.new(ForecastGenerator.new(params[:location]))
  end
end