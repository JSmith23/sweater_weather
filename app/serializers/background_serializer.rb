class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
  attributes :get_url
end
