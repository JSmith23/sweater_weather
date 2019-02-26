class FlickrService
  def initialize(tag)
    @tag = tag
  end

  def get_image
   get_json("services/rest/?method=flickr.photos.search&api_key=#{ENV['FLICKR_API_KEY']}&tags=#{@tag}&format=json&nojsoncallback=1")
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names:true)
  end

  def conn
    Faraday.new(:url => "https://api.flickr.com/services/rest/") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

end