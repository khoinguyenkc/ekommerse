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
        raise params.inspect
    end


end
