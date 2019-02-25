class Api::V1::ForecastsController < ApplicationController
  def show
    current = ForecastFacade.new(params).current_forecast
    daily =   ForecastFacade.new(params).daily_forecast
    hourly =  ForecastFacade.new(params).hourly_forecast
    render json: 
  end
end