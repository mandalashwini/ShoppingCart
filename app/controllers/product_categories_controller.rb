class ProductCategoriesController < ApplicationController
        skip_before_filter :verify_authenticity_token   
         layout 'admin/adminDashboard',only: [:index]
        DELIVERY_CHARGES = 100
    def new
        render layout: "admin/adminDashboard"
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
             render layout: "admin/adminDashboard"
              @ProductCategory
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
        product_id= @product_category.product_id
        @product_category.destroy
        redirect_to list_categories_path(product_id)
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
        @product_category=ProductCategory.find(params[:id])
       render layout: "home_layout"
       @product_category
      end

      def buy_confirmation
        @product_category=ProductCategory.find(params[:id])
        @quantity=params[:confirm][:quantity].to_i
        if @quantity == 0
          flash[:notice]="select quantity"
          redirect_to :back
        else
            if @quantity > @product_category.quantity
              flash[:notice]="to many orders.."
              redirect_to :back
            else
                @product_category.quantity = (@product_category.quantity.to_i) - @quantity
                @product_category.save!
                @Net_price = calculate_total_bill(@product_category,@quantity)
                Cart.create(buy_date: Date.today, product_category_id:@product_category.id, quantity: @quantity,net_price: @Net_price)
                flash[:notice] = "product added into card.."
                redirect_to homepage_path
        end
      end
   end

   

   def calculate_total_bill(product_category,quantity)
      total_amount=product_category.price * quantity
      gst = product_category.GST.to_i
      gst_amount= ( total_amount * gst ) / 100
      @Net_price = total_amount + gst_amount
   end
  
      private
      def category_params
        params.require(:ProductCategory).permit(:name,:price,:quantity,:description,{images: []})
      end

end
