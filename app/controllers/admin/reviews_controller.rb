class Admin::ReviewsController < ApplicationController
    def new
        #need to add check logged in
        if is_logged_in
            @review = Review.new
            @product = Product.find_by(id: params[:product_id])
        else
            #redirect with message 
        end

    end

    def create
            @review = Review.create(review_params)
            if @review.save
                redirect_to @review.product
            else
                @product = Product.find_by(id: params[:review][:product_id])
                render :new
    
            end
    

    end

    def show
        @review = Review.find(params[:id])
    end

    def edit
        @review = Review.find(params[:id])
        @product = @review.product

    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)
        if @review.save
            redirect_to @review.product
        else
            @product = Product.find_by(id: params[:review][:product_id])
            render :edit

        end


    end

    private 
    def review_params
        params.require(:review).permit(:content, :user_id, :product_id)
    end



end
