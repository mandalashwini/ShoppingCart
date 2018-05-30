class UserController < ApplicationController
  protect_from_forgery with: :null_session
  layout 'home_layout'
  def index
    @products=SearchOperations.searchProduct
  end
  
  def buyCategoryList
     @product=Product.find(params[:id])
  end

  

   def show_cart
   		@carts=current_user.carts
    end

    def search_result
      puts "12345"
      @categories=SearchOperations.searchCategories(params[:search].downcase)
    end

    def search
      render plain: params.inspect

    end
end

