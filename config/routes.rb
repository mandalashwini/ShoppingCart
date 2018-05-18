Rails.application.routes.draw do
  get 'user/index'

  devise_for :users
  #devise_for :users
  get 'home/index'
  root 'home#index'
  get 'admin/index'
  get 'admin/login'
  end
