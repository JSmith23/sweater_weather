class GifGenerator
  attr_reader :location
  def initialize(location)
    @location = location
  end

  # def images
  #   gif = @gif.map do |agif|
  #     Gif.new(agif)
  #   end
  # end

  def get_images
    images.map do |data|
      Gif.new(data)
    end
  end

  def images
    @location.map do |data|
      GiphyService.new(data[:icon]).get_data
    end
  end
end