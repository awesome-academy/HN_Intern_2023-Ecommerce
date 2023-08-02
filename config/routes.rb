Rails.application.routes.draw do
  root "products#index"
  
  get "/products", to: "products#index", as: "products"  
  get "/products/:id", to: "products#show", as: "product"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/users", to: "users#new"

  resources :users, only: %i(new create show)
end
