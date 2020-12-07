class UsersController < ApplicationController
    before_action :login_check, except: [:index, :new, :create, :welcome]
    before_action :current_user, except: [:index, :new, :create, :welcome]

    def index
        @users = User.all
    end

    def show
        @reservations = Reservation.future_reservations(@user.id)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "User successfully created!"
            redirect_to user_path(@user)
        else
            flash[:alert] = "Please try again."
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            # add error message
            render :edit
        end
    end

    def destroy
        # flash message
        @user.destroy
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def current_user
        @user = User.find_by_id(session[:user_id])
    end

    def login_check
        redirect_to '/' unless session[:user_id]
    end
end

# create_table "users", force: :cascade do |t|
#     t.string "first_name"
#     t.string "email"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.string "password_digest"
#     t.string "last_name"
#   end
