Rails.application.routes.draw do
  root 'posts#index'

  resources :about_me, only: [:index]
  resources :comments
  resources :contacts, only: [:index, :new, :create, :destroy]
  resources :posts
  resources :sessions, only: [:new, :create]

  get 'contacts/destroy_all', to: 'contacts#destroy_all'
end
