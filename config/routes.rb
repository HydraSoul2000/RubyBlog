Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :posts do
    resources :comments, only: [:create]
    resource :likes, only: [:create, :destroy]
  end

  get 'my_posts', to: 'posts#my_posts', as: :my_posts

  namespace :users do
    resource :profile, only: [:show], controller: 'profile'
  end

  resources :posts

  get 'home/index'
  get 'likes/create'
  get 'comments/create'
  get 'posts/index'
  get 'posts/show'
  get 'pages/home'
end
