class GifGenerator
  attr_reader :location
  def initialize(location)
    @location = location
    @daily = ForecastGenerator.new(@location).daily_forecast
  end

  def images
    @daily.map do |data|
      GiphyService.new(data.icon).get_data.map do |other|
        Gif.new(other)
      end
    end
  end
end