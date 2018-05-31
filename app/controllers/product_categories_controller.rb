class ProductCategoriesController < ApplicationController
        layout 'admin/adminDashboard',only:[:index, :new, :edit ]
        layout 'home_layout'
        DELIVERY_CHARGES = 100
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
         # render plain: params.inspect
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
        #render plain: params[:confirm][:quantity].to_i.inspect
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
                @product_category.orders.create(buy_date: Date.today, user_id: current_user.id, total_price: @Net_price, delivery_charges: DELIVERY_CHARGES )        #@cart = Hash.new
                Cart.create(buy_date: Date.today, product_category_id:@product_category.id, quantity: @quantity,net_price: @Net_price)
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
