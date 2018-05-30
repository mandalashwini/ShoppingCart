class UserController < ApplicationController
  protect_from_forgery with: :null_session
  layout 'home_layout'
  def index
    @products=SearchOperations.searchProduct
  end
  
  def buyCategoryList
     @product=Product.find(params[:id])
  end

  def buy_item
         @product_category=ProductCategory.find(params[:id])
         #render plain: params.inspect
         unless user_signed_in?
          puts "hhhh"
          redirect_to new_user_session_path
            #render :nothing => true
         end

        if user_signed_in?
          @product_category.update_attributes(quantity: (@product_category.quantity.to_i) - 1)
          puts "user==>#{current_user}"
          Cart.create(buy_date: Date.today, user_id: current_user.id,  product_category_id:@product_category.id)
          #redirect_to request.referer
          redirect_to :back
        end
      end

   def show_cart
   		@carts=current_user.carts
    end

    def search_result
      puts "12345"
      @categories=SearchOperations.searchCategories(params[:search].downcase)
     # @categories=@categories.page(params[:page]).per(2)
     #@categories = Kaminari.paginate_array(@categories).page(params[:page]).per(2)
      #puts "result#{@categories.class}"
      #redirect_to showCategoryList_path(@categories)
      #redirect_to :back
    end

    def search
      render plain: params.inspect

    end
end

