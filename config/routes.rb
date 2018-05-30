Rails.application.routes.draw do
  

  devise_for :users
  root 'user#index'
##Product
  get 'products/index', to: 'products#index', as: 'admindashboard'
  get 'products/new', to: 'products#new', as: 'new_product'
  post 'products', to: 'products#create'
  get 'products/:id',to: 'products#show', as: 'product' 
  get 'products/:id/edit', to: 'products#edit', as: 'edit_product'
  put '/products/:id', to: 'products#update'
  delete '/products/:id', to: 'products#destroy', as: 'delete_product'

  ###product_category
  get 'products/:id/product_categories/new', to: 'product_categories#new', as: 'new_category'
  post'products/:id/product_categories', to: 'product_categories#create', as: 'categories'
  get 'products/:id/product_categories/index', to: 'product_categories#index', as: 'list_categories'
  delete '/product_category/:id', to: 'product_categories#destroy', as: 'delete_product_category'
  get 'product_category/:id/edit', to: 'product_categories#edit', as: 'edit_product_category'
  put 'product_category/:id', to: 'product_categories#update',as: 'product_category'
    
  ####User View
  get 'user/index', to: 'user#index', as: 'homepage'
  get 'user/buyCategoryList/:id', to: 'user#buyCategoryList', as: 'buyCategoryList'
  get 'user/show_cart', to: 'user#show_cart', as: 'show_cart'
 
  #get  'user/search', as: 'search_page'
  get 'user/buy_item/:id',to: 'user#buy_item', as: 'buy_item'
  post 'user/search_result',to: 'user#search_result', as: 'search_result'
   #get 'user/show_category_list/:id', to: 'user#show_category_list', as: 'showCategoryList'
end