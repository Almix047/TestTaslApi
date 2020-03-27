Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index]
      resources :posts, only: %i[index create]
      resources :ratings, only: %i[create]
    end
  end
end
