Rails.application.routes.draw do
  devise_for :users
  # --- GET ---
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:index, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  resources :main, only: [:index]

  namespace :api do
    resources :users, only: [:index]
    resources :posts, only: [:index]
    resources :comments, only: [:index, :create]
  end

  root to: "users#index"
end
