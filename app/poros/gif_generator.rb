class GifGenerator
  attr_reader :location
  def initialize(location)
    @location = location
    @gif = GiphyService.new(@location).get_data
  end

  def get_gifs
    gif = @gif.map do |agif|
      Gif.new(agif)
    end
  end
end