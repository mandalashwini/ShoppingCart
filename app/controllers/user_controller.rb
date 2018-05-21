class UserController < ApplicationController
  layout 'home_layout'
  def index
    @products=Product.all
  end
  
end
