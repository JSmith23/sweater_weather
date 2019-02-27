class Favorites
  def make(favorite)
    forecast = ForecastGenerator.new(favorite.location).current
  end
end