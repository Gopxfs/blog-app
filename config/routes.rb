Rails.application.routes.draw do
  # --- GET ---
  # users
  get "users", to: "users#index"
  get "users/:id", to: "users#show"
  # users posts
  get "users/:user_id/posts", to: "posts#index"
  get "users/:user_id/posts/:id", to: "posts#show"

  root to: "users#index"
end
