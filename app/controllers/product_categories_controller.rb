class ProductCategoriesController < ApplicationController
    layout 'admin/adminDashboard'
    def new
        @ProductCategory=ProductCategory.new
      end

      def create
        @product=Product.find(params[:id])
        @ProductCategory=@product.product_categories.new(category_params)
        if params[:img].present?
          Image.create(product_category_id: @product_category, img: params[:img])
          puts "success!!"
        end
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

      

      private
      def category_params
        params.require(:ProductCategory).permit(:name,:price,:quantity,:description,:img)
      end

end
