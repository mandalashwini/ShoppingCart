class ProductCategoriesController < ApplicationController
    layout 'admin/adminDashboard'
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
    #render plain: params.inspect    
      end

      def index
        #render plain: params.inspect 
       @product=Product.find(params[:id])
      end


      def edit
        #render plain: params[:id].inspect
       @ProductCategory=ProductCategory.find(params[:id])
      end
    
      def update
        @ProductCategory=ProductCategory.find(params[:id])
        #render plain: params.inspect    
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
           redirect_to ProductCategory_path(@product_category)
        end
      end

      def show
        #render plain: params.inspect
        @product_category=ProductCategory.find(params[:id])
        respond_to do |format|
          format.html
          format.pdf do
            pdf = PdfGenerator.new(@product_category)
            send_data pdf.render, filename: "#{@product_category}.pdf" , type: "application/pdf" ,
                            disposition: "inline"

          end

        end

      end

      private
      def category_params
        params.require(:ProductCategory).permit(:name,:price,:quantity,:description,{images: []})
      end

end
