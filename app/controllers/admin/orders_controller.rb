class Admin::OrdersController < ApplicationController
    # def new
    #     @order = Order.new

    #     if is_logged_in && current_user.addresses.last #the last added address
    #          @address = current_user.addresses.last
    #     else
    #         @address = Address.new
    #     end


    # end

    def collect_address
        #STEP 1 in checkout flow
        #we're not passing anything. the view uses current_cart helper, which also has address
    end


    def update_address_and_first_assos #used to be create method. we modified a bit.
        #comes from first checkout step

        #raise params.inspect

        @order = current_order
        @order.update(order_params) #give it the address. 
        @order.address.user_id = current_user.id if current_user
        session[:current_address_id] = @order.address.id
        #if old address, it will not create new address. because we wrote a custom setter 

        session[:current_email] = params[:order][:address_attributes][:email]

        current_cart.compute_current_subtotal
        current_cart.compute_taxes(@order.address.zipcode, current_cart.subtotal) 
        @order.cart = current_cart #very important
        @order.save
        #this better work. user will not fix anything. 
        #unusual: no redirect. we go to next step: shipping options
        session[:order_id] = @order.id
        redirect_to shipping_path

    end

    def choose_shipping
    end

    def update_shipping
        #raise params.inspect
        @cart = current_cart
        #raise current_cart.compute_shipping_options.inspect
        @cart.shipping = @cart.compute_shipping_options[params[:order][:shippingoption].to_sym]
        @cart.save
        #raise @cart.shipping.inspect

        redirect_to payment_path #in orders controller
    end



    def payment
        #this shows a form. doesn't collect anything since we got no payment system. user just click submit
            if is_logged_in
                @nextpath = confirm_order_path
            else
                @nextpath = force_log_in_path
            end

    end

    def confirm_order

    end

    def finalize_order
        # mark order as paid
        @order = current_order
        @order.user = current_user
        current_user.addresses << @order.address #this is needed to prefill form next time
        @order.paid = true
        @order.save
        @cart = @order.cart
        @cart.save
        #then remove the session{:order_id], clear cart, etc.... but dont enable them until everything else is workingư
        #D-R-Y
        clear_cart
        clear_order
        clear_email
        clear_address
        #then
        render "thanks_for_order"

        
    end

    def show 
        @order = Order.find_by(id: params[:id])
        @cart = @order.cart
    end

    def index
        @orders = Order.all
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
                #:id #this is order id. it inherits cuz its nested.... 
            ]
        )
    end
    

end
