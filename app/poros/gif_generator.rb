class GifGenerator
  attr_reader :location
  def initialize(location)
    @location = location
    # @gif = GiphyService.new(@location).get_data
  end

  # def images
  #   gif = @gif.map do |agif|
  #     Gif.new(agif)
  #   end
  # end

  def images
    gif = @location.map do |data|
      forecast = GiphyService.new(data[:icon].term)
      binding.pry
      Gif.new(GiphyService.new(forecast))
    end
  end
end