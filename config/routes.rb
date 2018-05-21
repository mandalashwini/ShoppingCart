Rails.application.routes.draw do
  

  devise_for :users
  #devise_for :users
  
  #home_page routes
=begin  get '/index', to:'home#index'
  

  #admin dashboard
  get '/adminIndex', to:'admin#index' 
  get '/newProduct', to:'admin#newProduct'
  post '/new_product', to:'admin#new'
=end
root 'home#index'

##Product

  get 'products/index', to: 'products#index', as: 'admindashboard'
  get 'products/new', to: 'products#new', as: 'new_product'
      #url pattern            #controller#action   #prefix 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'products', to: 'products#create'
  get 'products/:id',to: 'products#show', as: 'product' 
  get 'products/:id/edit', to: 'products#edit', as: 'edit_product'
  put '/products/:id', to: 'products#update'
  delete '/products/:id', to: 'products#destroy', as: 'delete_product'
  #resources :products  #, except: ['new','create']
  #root 'products#index'


  ###product_category
  get 'products/:id/product_categories/new', to: 'product_categories#new', as: 'new_category'
  post'products/:id/product_categories', to: 'product_categories#create', as: 'categories'
  get 'products/:id/product_categories/index', to: 'product_categories#index', as: 'list_categories'
  get 'product_category/:id/edit', to: 'product_categories#edit', as: 'edit_product_category'
  put '/product_category/:id', to: 'product_categories#update',as: 'product_category'
  delete '/product_category/:id', to: 'product_categories#destroy', as: 'delete_product_category'

  ####User View
  get 'user/index', to: 'user#index', as: 'homepage'
  

  end
