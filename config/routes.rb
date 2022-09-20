Rails.application.routes.draw do
  # --- GET ---
  # users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :main, only: [:index]

  root to: "users#index"
end
