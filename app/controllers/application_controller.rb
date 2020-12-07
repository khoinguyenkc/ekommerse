class ApplicationController < ActionController::Base
    helper_method :is_logged_in, :current_user

    def is_logged_in
        #since these are also marked as helper methods, they are availalble in not just all ctronollers (cuz they inherit from appc ontroler) but also avialble to views

        (session[:user_id] && session[:user_id].present? ) ? true : false
    end

    def current_user
        @user = User.find_by(id: session[:user_id])
    end

end
