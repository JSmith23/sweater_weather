class FlickrService

  def initialize(forecast)
    @forecast = forecast
  end

  def get_coordinates
    get_data[:results][0][:geometry][:location]
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