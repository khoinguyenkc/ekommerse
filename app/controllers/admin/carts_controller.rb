class Admin::CartsController < ApplicationController
    def show
        #dont need to pass. views will grab cart from current_card helper method
        @cart = current_cart
    end

    #MOVED TO ORDERS CONTROLLER
    # def shipping
    #     #not CRUD. this is kinda an "EDIT" controller. but a specific kind of edit.
    #     render 'shipping'
    # end

    def edit
        #defunct. not in use
    end

    #MOVED TO ORDERS CONTROLLER
    # def update_shipping
    #     #raise params.inspect
    #     @cart = current_cart
    #     #raise current_cart.compute_shipping_options.inspect
    #     @cart.shipping = @cart.compute_shipping_options[params[:order][:shippingoption].to_sym]
    #     @cart.save
    #     #raise @cart.shipping.inspect

    #     redirect_to payment_path #in orders controller
    # end


    def clear_cart_id
        session.delete :cart_id
        render "welcome/home"
    end



    
    private
def cart_params
    #gotta be careful. cuz we don't want hacking to lower the bill or another user to pay... 
    
    params.require(:cart).permit(
        :coupon,
        :shipping,
        :taxes,
        #:subtotal,
        #:user_id,
)

    end



end
