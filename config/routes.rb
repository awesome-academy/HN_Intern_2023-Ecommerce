Rails.application.routes.draw do
  root "products#index"
  
  get "/products", to: "products#index", as: "products"  
  get "/products/:id", to: "products#show", as: "product"
end
