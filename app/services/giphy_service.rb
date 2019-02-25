class GiphyService
  attr_reader :term
  def initialize(term)
    @term = term
  end

  def get_data
    get_json("/v1/gifs/search?q=#{@term}")[:data]
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names:true)
  end

  def conn
    Faraday.new(:url => "http://api.giphy.com") do |faraday|
      faraday.params['key'] = ENV['GIPHY_API_KEY']
      faraday.adapter  Faraday.default_adapter
    end
  end

end