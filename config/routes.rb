Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :forecast, only: [:show]
      resource :backgrounds, only: [:show]
      resource :gifs, only: [:show]
      resources :users, only: [:create, :show]
      resource :session
      resources :favorites
    end
  end
end
