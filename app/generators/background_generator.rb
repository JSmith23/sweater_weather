class BackgroundGenerator
  attr_reader :location, :get_url
  def initialize(location)
    @location = location
    @flickr = FlickrService.new(@location).get_image
  end

  def get_url
    url = FlickrUrlGenerator.new.build_url(@flickr)
  end
end