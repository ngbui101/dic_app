Rails.application.routes.draw do
  root 'words#index'
  get "new" => "users#new"
  get     "login"    => "sessions#new"
  post    "login"    => "sessions#create"
  delete  "logout"   => "sessions#destroy"
  resources :users, :words
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
