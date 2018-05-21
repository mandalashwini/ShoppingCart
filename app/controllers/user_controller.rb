class UserController < ApplicationController
  layout 'home_layout'
  def index
    @product=Product.all
  end
  
end
