class DarkskyService
  def initialize(coord)
    @latitude = coord[:lat]
    @longitude = coord[:lng]
  end


  def get_forecast
    get_json("/forecast/#{ENV['DARK_SKY_KEY']}/#{@latitude},#{@longitude}")
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://api.darksky.net') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
