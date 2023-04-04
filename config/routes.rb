Rails.application.routes.draw do
  resources :users
  get '/', to: 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/destroy', to: 'sessions#destroy'
end
