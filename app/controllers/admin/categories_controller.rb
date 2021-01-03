class Admin::CategoriesController < ApplicationController
    def show
        @category = Category.find_by(id: params[:id])

        if params[:sort]
            if params[:sort] == "lowtohigh"
            @categoryproducts = @category.products.low_to_high
            elsif params[:sort] == "hightolow"
                @categoryproducts = @category.products.high_to_low
            end
        else
            @categoryproducts = @category.products
        end
    end

    def index
    
    end



    def new
        @category = Category.new
            #new, :create, :index, :show, :edit, :update, :destroy

    end


    def create
        # raise params.inspect
        @category = Category.new(category_params)
        if @category.save
            redirect_to category_path(@category)
        else
            render :new
        end
    end



    private
    def category_params
        params.require(:category).permit(:name)
    end





end
