Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'home/index'
  get 'likes/create'
  get 'comments/create'
  get 'posts/index'
  get 'posts/show'
  get 'pages/home'
end
