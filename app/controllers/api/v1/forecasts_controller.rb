class Api::V1::ForecastsController < ApplicationController
  def show
    render json: ForecastSerializer.new(ForecastGenerator.new(params[:location]))
  end
end