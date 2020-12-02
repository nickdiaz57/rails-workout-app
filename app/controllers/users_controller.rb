class UsersController < ApplicationController
    #add before action for login check

    def index
        @users = User.all
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            redirect_to user_path(user)
        else
            # add an error message
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find_by_id(params[:id])
    end

    def update
        # add confirmation for password change
        # add partial for new and edit forms
        @user = User.find_by_id(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            # add error message
            render :edit
        end
    end

    def destroy
        # add confirmation of profile delete
        @user.destroy
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

# create_table "users", force: :cascade do |t|
#     t.string "name"
#     t.string "email"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.string "password_digest"
#   end
