Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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
    resources :users, only: [:index] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end

  root to: "users#index"
end
