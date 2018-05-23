class UserController < ApplicationController
  layout 'home_layout'
  def index
    @products=Product.all
  end
  
  def buyList
     @product=Product.find(params[:id])
  end
end
