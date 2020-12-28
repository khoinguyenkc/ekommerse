class ApplicationController < ActionController::Base
    helper_method :is_logged_in, :current_user, :current_cart, :current_order, :current_email, :current_or_dummy_user, :free_shipping_threshold
    #this makes it available to not just contorllers, but views too

    def is_logged_in
        #since these are also marked as helper methods, they are availalble in not just all ctronollers (cuz they inherit from appc ontroler) but also avialble to views

        (session[:user_id] && session[:user_id].present? ) ? true : false
    end

    def current_user
        @user = User.find_by(id: session[:user_id])
    end

    def current_cart
        if !session[:cart_id] 
            newcart = Cart.create
            session[:cart_id] = newcart.id
            newcart #implicit return
        else
            Cart.find_by(id: session[:cart_id])
        end
    end

    def current_order 
        if !session[:order_id] 
            @order = Order.new

            if is_logged_in && current_user.addresses.last #the last added address
                @order.address = current_user.addresses.last #theres some bug. it's grabbing another user's address info ...
                @order.save
            else
                @order.address = Address.new
                @order.save
            end

        else
            @order = Order.find_by(id: session[:order_id])
        end

            @order.cart = current_cart
            @order.save
            @order #implicit return

    end

    def current_email
        #this TRY to initialize, not guranteed.. if user enter an email when they buy, then the email is saved. we'll later use this to help them signup/login
            session[:current_email] = current_user.email if current_user && current_user.email
            session[:current_email] 
    end

    def current_or_dummy_user
        if is_logged_in
            current_user
        else
            User.new(email: "dummy@dummy.com", password: SecureRandom.hex )
        end
    end

    def free_shipping_threshold
        50.00    
    end

    def clear_cart
        session.delete :cart_id if session[:cart_id] 
    end

    def clear_order
        session.delete :order_id if session[:order_id]
    end













end
