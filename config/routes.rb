Rails.application.routes.draw do
  root to: 'home#top'
  get "/home/about" => "home#about"
  devise_for :users
  resources :books, except: [:new]
  resources :users, only: [:index, :show, :edit, :update]
end