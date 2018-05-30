class ProductCategoriesController < ApplicationController
        layout 'home_layout'
    def new
        @ProductCategory=ProductCategory.new
      end

      def create
        @product=Product.find(params[:id])
        @ProductCategory=@product.product_categories.new(category_params)
        if @ProductCategory.save
            redirect_to list_categories_path(@product)
        else
            render :new
        end
    
      end

      def index
          @product=Product.find(params[:id])
      end

      def edit
          @ProductCategory=ProductCategory.find(params[:id])
      end
    
      def update
        @ProductCategory=ProductCategory.find(params[:id])
        if(@ProductCategory.update(category_params))
          flash[:notice] = "record updated!!!!"
          redirect_to list_categories_path(@ProductCategory.product_id)
        else
          render :edit
        end 
      end  

      def destroy
        @product_category=ProductCategory.find(params[:id])
        @product_category.destroy
        redirect_to list_categories_path
      end

      def buy_item
         @product_category=ProductCategory.find(params[:id])
         unless user_signed_in?
             redirect_to new_user_session_path
         end
        if user_signed_in?
            redirect_to ProductCategory_path(@product_category)
        end
      end

      def show
       # render plain: params.inspect
        @product_category=ProductCategory.find(params[:id])
        respond_to do |format|
          format.html
          format.pdf do
            pdf = PdfGenerator.new(@product_category)
            send_data pdf.render, filename: "#{@product_category}.pdf" , type: "application/pdf" ,
                            disposition: "inline"
           end
          @product_category
        end
      end

      def buy_confirmation
        @product_category=ProductCategory.find(params[:id])
        @product_category.quantity = (@product_category.quantity.to_i) - 1
        #@product_category.update_attributes!(quantity: (@product_category.quantity.to_i) - 1)
        @product_category.save!
        binding.pry
        Cart.create(buy_date: Date.today, user_id: current_user.id,  product_category_id:@product_category.id)
        flash[:notice] = "Thank You !!"
        redirect_to homepage_path
      end

      private
      def category_params
        params.require(:ProductCategory).permit(:name,:price,:quantity,:description,{images: []})
      end

end
