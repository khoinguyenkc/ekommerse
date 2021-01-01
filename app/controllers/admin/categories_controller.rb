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


    
end
