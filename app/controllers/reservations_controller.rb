class ReservationsController < ApplicationController
    def index
        @reservations = User.find_by_id(params[:user_id]).reservations.select {|r| r.workout.date.to_date.future?}
        # byebug
    end

    def show
        @reservation = Reservation.find_by_id(params[:id])
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