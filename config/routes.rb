Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes, except: :delete do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end
  resources :users,      only: [:edit, :update, :show]
  resources :tags, only: [:index, :show]

  scope module: :prototypes do
    resources :popular, only: :index
  end
end
