class FlickrService



  def get_coordinates
   get_json()
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