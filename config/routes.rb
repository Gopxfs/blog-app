Rails.application.routes.draw do
  get "users", to: "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
