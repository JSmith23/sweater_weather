class Gif
  attr_reader :url, :time, :summary
  def initialize(data)
    @url = data[:url]
    @time = data[:import_datetime]
    @summary = data[:title]
  end
end