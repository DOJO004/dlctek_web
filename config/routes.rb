Rails.application.routes.draw do
  root 'pages#home'
  resources :products
  resources :carts
  resources :articles
  
  get "dashboard", to: "pages#dashboard"
  get "about_us", to: "pages#about_us"
  get "service_item_card", to: "pages#service_item_card"
  get "core_value_card", to: "pages#core_value_card"

  post "add_cart", to: "carts#add_cart"
  delete "delete_cart_item/:id", to: "carts#delete_cart_item", as: :delete_cart_item

  devise_for :users, controllers:{
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
}
end
