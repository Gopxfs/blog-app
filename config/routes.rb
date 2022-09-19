Rails.application.routes.draw do
  get "users", to: "users#index"

  root to: "users#index"
end
