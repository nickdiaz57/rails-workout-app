class WorkoutsController < ApplicationController
    def index
    end

    def show
    end

    def new
        @workout = Workout.new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def workout_params
        params.require(:workout).permit(:content, :date)
    end
end

# create_table "workouts", force: :cascade do |t|
#     t.string "content"
#     t.datetime "date"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end