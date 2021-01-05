class Admin::ProductsController < ApplicationController
    before_action :require_admin_logged_in
    skip_before_action :require_admin_logged_in, only: [:show]

    def show
        @product = Product.find(params[:id])
    end

    def new
        if params[:category_id]
            @product = Product.new
            @category_id = params[:category_id]
            #lets hope this is saved.... if not we pass it as down and then save it in hidden field

        else
            @product = Product.new
        end
    end

    def create
        # raise params.inspect
            
        @product = Product.create(product_params)
        if @product.save
            redirect_to @product
        else
            render :new

        end
      

    end

    def edit
        @product = Product.find(params[:id])

    end

    def update
        @product = Product.find(params[:id])
        @product.update(product_params)

        if @product.save
            redirect_to @product
        else
            render :edit
        end

    end



    def index
        if params[:category_id]
            @category = Category.find_by(id: params[:category_id])
            @products = @category.products
        else
            @products = Product.all
        end

    end

    def destroy
        @product = Product.find(params[:id])

        @product.category_products.each do | cp |
            cp.delete #the category_products array still lhas it but the @product will delete 
        end
        productname = @product.name
        @product.delete

        redirect_to products_path,  notice: "Category #{productname} deleted"
    end


    private
    def product_params
        params.require(:product).permit(:name, :description, :image, :current_price, category_ids: [])
    end



end
