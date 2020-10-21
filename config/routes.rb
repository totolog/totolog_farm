Rails.application.routes.draw do
  get 'sessions/new'
  get "/signup", to:'users#new'
  root 'static_pages#home'
  resources :users
  get "/login", to:"sessions#new"
  post "/login", to:"sessions#create"
  delete "/logout", to:"sessions#destroy"

end
