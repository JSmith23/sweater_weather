class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
  attributes :daily_forecast, :current, :hourly_forecast
end
