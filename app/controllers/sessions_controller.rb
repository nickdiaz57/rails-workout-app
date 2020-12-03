class SessionsController < ApplicationController

    def create
        # add error handling for trying to log in a user that doesnt exist 
        user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end