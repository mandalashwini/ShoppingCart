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
   		@carts=Cart.all
    end

    def search_result
      puts "12345"
      @categories=SearchOperations.searchCategories(params[:search].downcase)
      if @categories.present?
        @categories
      else
        flash[:notice]="search not found!!"
        redirect_to homepage_path
      end
    end

    def search
      render plain: params.inspect

    end
end

