class GeocodeService

  def initialize(location)
    @location = location
  end

  def get_coordinates
    get_data[:results][0][:geometry][:location]
  end

  def get_data
    get_json("/maps/api/geocode/json?address=#{@location}")
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names:true)
  end

  def conn
    Faraday.new(:url => "https://maps.googleapis.com") do |faraday|
      faraday.params['key'] = ENV['GEO_CODE_KEY']
      faraday.adapter  Faraday.default_adapter
    end
  end

end