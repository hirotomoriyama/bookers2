Rails.application.routes.draw do
  get 'search/search'
  root to: 'home#top'
  get "/home/about" => "home#about"
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]

  resources :books, except: [:new] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  get 'follow/:id' => 'relationships#follow_index', as:'follows'
  get 'follower/:id' => 'relationships#follower_index', as:'followers'
  post 'follow/:id' => 'relationships#create', as:'follow'
  post 'unfollow/:id' => 'relationships#destroy', as:'unfollow'
end