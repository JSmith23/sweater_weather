class GiphySerializer
  include FastJsonapi::ObjectSerializer

  attributes :images
end
