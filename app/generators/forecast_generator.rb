class ForecastGenerator
  attr_reader :location
  def initialize(location)
    @location = location
    @geo = GeocodeService.new(@location).get_coordinates
    @dark = DarkskyService.new(@geo).get_forecast
  end

  def current
    dark = @dark[:currently]
    CurrentForecast.new(dark)
  end

  def daily_forecast
    dark = @dark[:daily][:data]
    dark.map do |daily_data|
      DailyForecast.new(daily_data)
    end
  end

  def hourly_forecast
    dark = @dark[:hourly][:data]
    dark.map do |hourly_data|
      HourlyForecast.new(hourly_data)
    end
  end
end