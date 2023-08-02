Rails.application.routes.draw do
  root "products#index"
  
  get "/products", to: "products#index", as: "products"  
  get "/products/:id", to: "products#show", as: "product"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/users", to: "users#new"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: %i(new create show)
end
