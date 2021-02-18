Rails.application.routes.draw do
  root 'books#index'
  get "/home/about" => "home#about"
  devise_for :users
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
end