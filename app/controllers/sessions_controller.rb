class SessionsController < ApplicationController

    def new  
        @user = User.new
    end

    def force_log_in
        @user = User.new
    end


    def create
        #deal with regular login AND OAuth

        if params[:user] #regular
            # raise params.inspect

            @user = User.find_by(email: params[:user][:email])
            authenticated = @user.try(:authenticate, params[:user][:password])

             if authenticated 
                session[:user_id] = @user.id
                redirect_to root_path
             else        
                # redirect_to new_session_path
                redirect_back fallback_location: new_session_path, notice: "Could not verify login. Please try again"

             end

        else #OAuth

            @user = User.find_by(uid: auth['uid']) 

            @user = User.create(uid: auth['uid'], password: SecureRandom.hex)  if !@user
            #without a password, it wont save to db! (probably because you're using has_secure_password)
            #so need a random password, we just won't check them

            #update info/add info:
            @user.name = auth['info']['name']
            @user.email = auth['info']['email']
            @user.image = auth['info']['image']
            @user.save
            session[:user_id] = @user.id
            redirect_to root_path
    
        end


    end

    def destroy
        session.delete :user_id if session[:user_id]

        clear_cart
        clear_order

        redirect_to root_path
    end


    private

    def auth
        request.env['omniauth.auth']
        #the fb oauth hash will look like this:
        ##<OmniAuth::AuthHash 
        #     credentials=#<OmniAuth::AuthHash 
        #         expires=true 
        #         expires_at=1612475384 
        #         token="EAAMZAhG97KgkBABhTJukh2DlYaIETmkZCZCCYt5yZAhYqz0P30OKOIiM6Q0zZCCNLuAOWdaCDGyiK5DcVGpuDQMruAkHlZAsJRZCjyrNcjkE5TrimzvTOIZCuCWcD2ZANw24KVKPszPysaz6DcZBphDRBp5QO81lDsmNEZD"> 
                
        #         extra=#<OmniAuth::AuthHash 
        #             raw_info=#<OmniAuth::AuthHash 
        #                 email="aodaithuylam1@gmail.com" 
        #                 id="10214482819703544" 
        #                 name="Lam Nguyen"
        #             >
        #         > 
                
        #         info=#<OmniAuth::AuthHash::InfoHash 
        #             email="aodaithuylam1@gmail.com" 
        #             image="http://graph.facebook.com/v4.0/10214482819703544/picture?access_token=EAAMZAhG97KgkBABhTJukh2DlYaIETmkZCZCCYt5yZAhYqz0P30OKOIiM6Q0zZCCNLuAOWdaCDGyiK5DcVGpuDQMruAkHlZAsJRZCjyrNcjkE5TrimzvTOIZCuCWcD2ZANw24KVKPszPysaz6DcZBphDRBp5QO81lDsmNEZD" 
        #             name="Lam Nguyen"
        #         > 

        #         provider="facebook" 
        #         uid="10214482819703544"
        # >

    end

end
