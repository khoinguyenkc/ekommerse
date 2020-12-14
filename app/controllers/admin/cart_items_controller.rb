class Admin::CartItemsController < ApplicationController
    def create
        #when user add to cart a product, a form is submitted here
        # raise params.inspect



        @cartitem = CartItem.create(cart_item_params)
        #its OUR job, not user, to ensure this works. 
        amount = @cartitem.price * @cartitem.quantity
        @cartitem.amount = amount
        @cartitem.save
        # flash.now[:notice] = 'Added to Cart'
        # redirect_to(request.env['HTTP_REFERER']) #this doesn't play well with notice:.... for some reason
        redirect_back fallback_location: product_path(Product.find_by(id: @cartitem.product_id)) , notice: "Added to Cart"


    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:price, :product_id, :cart_id, :quantity)
        #i havent figured out from where will we get the note and discount yet, we'll just getting the basics to work first
    end


    
end
