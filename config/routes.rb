Rails.application.routes.draw do
  root to: 'home#index'
  resources :posts, only: [:new, :create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/destroy', to: 'sessions#destroy'
end
