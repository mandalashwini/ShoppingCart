class UserController < ApplicationController
  protect_from_forgery with: :null_session
  layout 'home_layout'
  def index
    @products=SearchOperations.searchProduct
  end
  
  def buyCategoryList
     @product=Product.find(params[:id])
     # @product= Kaminari.paginate_array(@product).page(params[:page]).per(2)
  end

   def show_cart
   		@carts=Cart.all
    end

    def search_result
        if params[:search] == ""
          flash[:notice]="Search not found!!"
          redirect_to homepage_path
        else
           @categories=SearchOperations.searchCategories(params[:search].downcase)
           if @categories.present?
              @categories
               #= @categories.page(params[:page]).per(3)
           else
              flash[:notice]="Search not found!!"
              redirect_to homepage_path
           end
        end
    end

    def pdf_generator
      #render plain: params.inspect
       @cart=Cart.all
        respond_to do |format|
          format.html
          format.pdf do
            pdf = PdfGenerator.new(@cart)
            send_data pdf.render, filename: "#{@product_category}.pdf" , type: "application/pdf" ,
                            disposition: "inline"
           end
          @cart
        end
    end
end

