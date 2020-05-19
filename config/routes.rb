Rails.application.routes.draw do
  root 'posts#index'

  resources :comments
  resources :posts
  resources :about_me, only: [:index]
  resources :contacts, only: [:index, :new, :create, :destroy]

  get 'contacts/destroy_all', to: 'contacts#destroy_all'
end
