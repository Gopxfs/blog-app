Rails.application.routes.draw do
  # --- GET ---
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:new, :create]
    end
  end

  resources :main, only: [:index]

  root to: "users#index"
end
