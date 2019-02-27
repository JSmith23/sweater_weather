class GifGenerator
  attr_reader :location, :id

  def initialize(daily_forecast_objects)
    @id = 'id'
    @daily_forecast_objects = daily_forecast_objects
    @daily = ForecastGenerator.new(@daily_forecast_objects).daily_forecast
  end

  def images
    @daily.flat_map do |data|
      GiphyService.new(data.icon).get_data.map do |other|
        Gif.new(other)
      end
    end
  end
end