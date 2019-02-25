class GiphySerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
  attributes :get_gifs
end
