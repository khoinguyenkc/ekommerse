class Admin::ProductsController < ApplicationController
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
        raise params.inspect
    end


    def index
        if params[:category_id]
            @category = Category.find_by(id: params[:category_id])
            @products = @category.products
        else
            @products = Product.all
        end

    end


end
