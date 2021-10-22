Rails.application.routes.draw do
  root 'words#index'
  get "new" => "users#new"
  get     "login"    => "sessions#new"
  post    "login"    => "sessions#create"
  delete  "logout"   => "sessions#destroy"
  resources :users
  resources :words
end
