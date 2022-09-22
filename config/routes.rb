Rails.application.routes.draw do
  # --- GET ---
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
    end
  end

  resources :main, only: [:index]

  root to: "users#index"
end
