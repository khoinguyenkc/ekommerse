class Admin::CartItemsController < ApplicationController
    def create
        #when user add to cart a product, a form is submitted here
        # raise params.inspect


        #security check: check that price match product's current price
        #unfinished


        @cartitem = CartItem.create(cart_item_params)
        #its OUR job, not user, to ensure this works. 
        @cartitem.compute_amount
        @cartitem.save
        binding.pry
        # flash.now[:notice] = 'Added to Cart'
        # redirect_to(request.env['HTTP_REFERER']) #this doesn't play well with notice:.... for some reason
        redirect_back fallback_location: product_path(Product.find_by(id: @cartitem.product_id)) , notice: "Added to Cart"


    end

    def special_update
        #our edit form looks like this: form_for @cart.cart_items.find( |item| item.product_id == product.id )
        #so we gotta edit this cart item, THEN DELETE ALL OTHER CART ITEMS OF THE SAME PRODUCT
        #ex: we have 2 cart items of same product, 2 + 3 = 5 quantities, 
        #if user edit it to 4, then we chagne first cart item to 4, then delete the second cart item.
        raise params.inspect
        # <ActionController::Parameters {
        #     "_method"=>"patch", 
        #     "authenticity_token"=>"fqgWaIybUlcA+eQoWJQx67wok0qsydTVD72vKrL6u8nijjuhaJLktCDysrSQ640NILM2TrDvT9162pS6bsxu4Q==",
        #      "cart_item"=>{
        #          "quantity"=>"3", 
        #          "product_id"=>"1",
        #           "cart_id"=>"15"}, 
        #     "commit"=>"Update", "method"=>"patch", "controller"=>"admin/cart_items", "action"=>"special_update"} permitted: false>

        @cart_item = @current_cart.cart_items.find{ |item| item.product_id == params[:cart_item][:product_id] }
        @cart_item.update(special_update_params)
        if @cart_item.save
            #delete other cart items
            #redirect to cart and gives a notice notice: "Quantity updated."
        else
        end

        # want special check. no changing of price. only quantitty!!!!!
        #we're not dealing with edge cases of product price c hange
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:price, :product_id, :cart_id, :quantity)
        #i havent figured out from where will we get the note and discount yet, we'll just getting the basics to work first
    end

    def special_update_params
        params.require(:cart_item).permit(:product_id, :cart_id, :quantity)
    end



    
end
