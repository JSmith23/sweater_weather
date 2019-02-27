class FlickrUrlGenerator
  def build_url(data)
    url = "https://farm#{data[:farm]}.staticflickr.com/#{data[:server]}/#{data[:id]}_#{data[:secret]}.jpg"
  end
end