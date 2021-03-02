Rails.application.routes.draw do
  root to: 'home#top'
  get "/home/about" => "home#about"
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, except: [:new] do
    resources :book_comments, only: [:create, :destroy]
  end
end