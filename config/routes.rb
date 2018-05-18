Rails.application.routes.draw do
  

  devise_for :users
  #devise_for :users
  
  #home_page routes
  get '/index', to:'home#index'
  root 'home#index'

  #admin dashboard
  get '/adminIndex', to:'admin#index' 
  get '/newProduct', to:'admin#newProduct'
  post '/new_product', to:'admin#new'
  
  end
