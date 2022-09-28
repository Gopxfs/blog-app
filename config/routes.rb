Rails.application.routes.draw do
  devise_for :users
  # --- GET ---
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end

  resources :main, only: [:index]

  root to: "users#index"
end
