class UsersController < ApplicationController
    #add before action for login check
    before_action :login_check, except: [:index, :new, :create, :welcome]
    before_action :current_user, except: [:index, :new, :create, :welcome]

    def index
        @users = User.all
    end

    def show
        # @user = current_user
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
            render :new
        end
    end

    def edit
        # @user = current_user
    end

    def update
        # add confirmation for password change
        # add partial for new and edit forms
        # @user = current_user
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            # add error message
            render :edit
        end
    end

    def destroy
        # user = current_user
        @user.destroy
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def current_user
        @user = User.find_by_id(params[:id])
    end

    def login_check
        redirect_to '/' unless session[:user_id]
    end
end

# create_table "users", force: :cascade do |t|
#     t.string "name"
#     t.string "email"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.string "password_digest"
#   end
