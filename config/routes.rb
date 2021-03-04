Rails.application.routes.draw do
  root to: 'home#top'
  get "/home/about" => "home#about"
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]

  resources :books, except: [:new] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  get 'follow/:id' => 'relationships#index', as:'followlists'
  get 'unfollow/:id' => 'relationships#index', as:'unfollowlists'
  post 'follow/:id' => 'relationships#create', as:'follow'
  post 'unfollow/:id' => 'relationships#destroy', as:'unfollow'
end