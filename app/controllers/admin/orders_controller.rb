class Admin::OrdersController < ApplicationController
    def new
        @order = Order.new

        if is_logged_in && current_user.addresses.last #the last added address
             @address = current_user.addresses.last
        else
            @address = Address.new
        end


    end

    def create
        #raise params.inspect
        @order = Order.create(order_params)
        current_cart.compute_current_subtotal
        @order.cart = current_cart #very important
        @order.save
        #this better work. user will not fix anything. 
        #unusual: no redirect. we go to next step: shipping options

        render 'shipping'
    end


    def update
        #WARNING:
        #the params sent here need to have something to identify what view it came from, so we know what to update and what tto render next

    end

    private
    def order_params
        params.require(:order).permit(
            address_attributes: [
                :street,
                :city,
                :state,
                :country,
                :zipcode,
                :address_type,
                :id
            ]
        )
    end
    

end
