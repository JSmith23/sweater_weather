class FlickrService

  def initialize(tags)
    @tags = tags
  end

  def get_image
    get_json("?method=flickr.photos.search&api_key=#{ENV['FLICKR_API_KEY']}&tags=#{@tags}&format=json&nojsoncallback=1")
    binding.pry
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names:true)
  end

  def conn
    Faraday.new(:url => "https://api.flickr.com/services/rest/") do |faraday|
      faraday.params['key'] = ENV['FLICKR_API_KEY']
      faraday.adapter  Faraday.default_adapter
    end
  end

end