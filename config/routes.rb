Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :forecast, only: [:show]
      resource :background, only: [:show]
      resource :gifs, only: [:index]
    end
  end
end
