Rails.application.routes.draw do
  root to: 'home#index'
  resources :posts, only: %i[new create]
  resources :sessions, only: %i[new create destroy]
end
