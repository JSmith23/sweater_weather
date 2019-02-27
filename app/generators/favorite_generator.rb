class FavoriteGenerator
  def initialize(user)
    @user = user
    @user_id = user.id
    @favorites = user.favorites
  end

  def favorites_list
    favorites = []
    @favorites.each do |favorite|
      favorites << {location: favorite.location,
         current_weather: Favorites.new.make(favorite)}
    end
    favorites
  end
end

