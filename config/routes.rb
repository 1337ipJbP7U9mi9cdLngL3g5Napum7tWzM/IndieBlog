Rails.application.routes.draw do
  resources :comments
  root 'posts#index'

  resources :posts
  resources :about_me, only: [:index]
end
