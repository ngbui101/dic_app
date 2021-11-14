Rails.application.routes.draw do
  get 'home/index'
  root 'words#index'

  resources :words

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  resources :users
  
end
