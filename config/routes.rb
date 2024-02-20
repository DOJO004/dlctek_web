Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers:{
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
}
  get "about_us", to: "pages#about_us"
end
