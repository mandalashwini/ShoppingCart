class UserController < ApplicationController
  layout 'home_layout'
  def index
    @products=Product.all
  end
  
  def list_categories
     response_to do |format|
      format.js
    end
  end
end
