class ForecastFacade
  def initialize(location)
    @location = location
  end

  def current_forecast
    dark = dark_sky[:currently]
    CurrentForecast.new(dark)
  end

  def hourly_forecast
    dark = dark_sky[:hourly][:data]
      dark.map  do |hourly_data|
      HourlyForecast.new(hourly_data)
    end
  end

  def daily_forecast
    dark = dark_sky[:daily][:data]
    dark.map do |daily_data|
      DailyForecast.new(daily_data)
    end
  end

  private

  def geo_code
    @geo ||= GeocodeService.new(@location).get_coordinates
  end

  def dark_sky
    @dark ||= DarkskyService.new(geo_code).get_forecast
  end

end