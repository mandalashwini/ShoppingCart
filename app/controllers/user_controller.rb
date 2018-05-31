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

