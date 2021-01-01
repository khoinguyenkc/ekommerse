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
        raise params.inspect
        #<ActionController::Parameters {
            # "authenticity_token"=>"5PR7r3BWVd8FEFwv9rCpbvlzJ2w664lHTXN3Ju7rPIR40lZmlF/jPCUbCrM+zxWIZeiCaCbNEk84FEy2Mt3prA==", 
            # "review"=>{
            #     "content"=>"they are quite fancy and dandy", 
            #     "product_id"=>"7",
            #      "user_id"=>"3"},

            #  "commit"=>"Create Review",
            # "controller"=>"admin/reviews", 
            # "action"=>"create", 
            # "product_id"=>"7"}   
              
            #       permitted: false>

    end

    def show
        @review = Review.find(params[:id])
    end

    def edit
    end

    def update
    end


end
