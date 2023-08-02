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

  get "/cart", to: "cart_items#index"
  post "/add_to_cart", to: "cart_items#create"
  patch "/update_quantity", to: "cart_items#update", as: :update_quantity

  resources :users, only: %i(new create show)
  resources :products, only: %i(index show)
  resources :cart_items, only: %i(index create update destroy)
end
