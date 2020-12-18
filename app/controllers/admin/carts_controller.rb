class Admin::CartsController < ApplicationController
    def show
        #dont need to pass. views will grab cart from current_card helper method
    end

    def shipping
        #not CRUD. this is kinda an "EDIT" controller. but a specific kind of edit.
        render 'shipping'
    end

    def edit
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
