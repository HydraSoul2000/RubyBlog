Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :posts do
    resources :comments, only: [:create]
    resource :likes, only: [:create, :destroy]
  end

  root 'posts#index'

  get 'home/index'
  get 'likes/create'
  get 'comments/create'
  get 'posts/index'
  get 'posts/show'
  get 'pages/home'
end
