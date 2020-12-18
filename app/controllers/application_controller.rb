class ApplicationController < ActionController::Base
    helper_method :is_logged_in, :current_user, :current_cart, :current_or_dummy_user, :free_shipping_threshold
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















end
