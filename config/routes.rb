Rails.application.routes.draw do
  get 'cart_items/create'
  get 'sessions/new'
  get "/signup", to:'users#new'
  root 'static_pages#home'
  resources :users
  get "/login", to:"sessions#new"
  post "/login", to:"sessions#create"
  delete "/logout", to:"sessions#destroy"
  
  resources :products
  
  resources :farmers
  get "/farmer_login", to:"farmer_session#new"
  post "/farmer_login", to:"farmer_session#create"
  delete "/farmer_logout", to:"farmer_session#destroy"

  resources :cart_items

end
