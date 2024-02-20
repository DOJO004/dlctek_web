Rails.application.routes.draw do
  root 'pages#home'
  resources :products
  
  get "dashboard", to: "pages#dashboard"
  get "store", to: "pages#store"
  get "about_us", to: "pages#about_us"

  devise_for :users, controllers:{
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
}
end
