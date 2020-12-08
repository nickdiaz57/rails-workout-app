class SessionsController < ApplicationController

    def create
        user = User.find_by(email: params[:user][:email])
        if user
            if user.authenticate(params[:user][:password])
                flash[:alert] = "Success!"
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                flash[:alert] = "Incorrect password. Please try again."
                render :new
            end
        else
            flash[:alert] = "We could not find your account. Please check your information, or create an account."
            redirect_to '/'
        end
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