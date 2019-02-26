class GiphySerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
  attributes :images
end
