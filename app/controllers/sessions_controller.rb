class SessionsController < ApplicationController

    def create
        # add better error handling for trying to log in a user that doesnt exist 
        user = User.find_by(email: params[:user][:email])
        return head(:forbidden) unless user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    def google_login
        user_email = request.env['omniauth.auth']['info']['email']
        user_first_name = request.env['omniauth.auth']['info']['first_name']
        user_last_name = request.env['omniauth.auth']['info']['last_name']

        @user = User.find_or_create_by(email: user_email) do |user|
            user.first_name = user_first_name
            user.last_name = user_last_name
            user.password = SecureRandom.hex
        end

        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
end