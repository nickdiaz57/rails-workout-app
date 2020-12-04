class ReservationsController < ApplicationController
    def index
        @reservations = User.find_by_id(params[:user_id]).reservations.select {|r| r.workout.date.to_date.future?}
        # byebug
    end

    def show
        @reservation = Reservation.find_by_id(params[:id])
        @users = @reservation.workout.users
    end

    def new
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path, alert: "User not found."
          else
            @reservation = Reservation.new(user_id: params[:user_id])
            @workouts = Workout.all.select {|w| w.date.to_date.future?}
        end
    end

    def create
        # byebug
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            redirect_to user_reservations_path(@reservation.user)
        else
            render :new # add error message
        end
    end

    def edit

    end

    def update

    end

    private

    def reservation_params
        params.require(:reservation).permit(:score, :user_id, :workout_id)
    end
end

# create_table "reservations", force: :cascade do |t|
#     t.string "score"
#     t.integer "user_id"
#     t.integer "workout_id"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["user_id"], name: "index_reservations_on_user_id"
#     t.index ["workout_id"], name: "index_reservations_on_workout_id"
#   end