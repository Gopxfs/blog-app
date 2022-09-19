Rails.application.routes.draw do
  # --- GET ---
  # users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  root to: "users#index"
end
