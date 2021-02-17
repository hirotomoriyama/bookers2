Rails.application.routes.draw do
  root 'books#index'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :destroy]
end
