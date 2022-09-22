Rails.application.routes.draw do
  # --- GET ---
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  resources :main, only: [:index]

  root to: "users#index"

  # --- Post ---
  post 'create_comment', to: 'comment#create'
end
