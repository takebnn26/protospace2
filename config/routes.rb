Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes, except: :delete do
    resources :likes, only: [:create, :destroy]
  end
  # resources :comments, only: :create
  resources :users,      only: [:edit, :update, :show]
end
