Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes, except: :delete
  # resources :comments, only: :create
  resources :users,      only: [:edit, :update, :show]
end
