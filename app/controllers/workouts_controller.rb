class WorkoutsController < ApplicationController
    before_action :current_workout, except: [:index, :new, :create]

    def index
        @workouts = Workout.all
    end

    def show
        # byebug
        # @workout = current_workout
    end

    def new
        @workout = Workout.new
    end

    def create
        # byebug
        # change to allow assigning to a user on creation
        workout = Workout.new(workout_params)
        if workout.save
            redirect_to workout_path(workout)
        else
            # add an error message
            render :new
        end
    end

    def edit
        # @workout = current_workout
    end

    def update
        # add partial for new and edit forms
        # @workout = current_workout
        if @workout.update(workout_params)
            redirect_to workout_path(@workout)
        else
            # add error message
            render :edit
        end
    end

    def destroy
        # workout = current_workout
        @workout.destroy
        redirect_to workouts_path
    end

    private

    def workout_params
        params.require(:workout).permit(:title, :content, :date)
    end

    def current_workout
        @workout = Workout.find_by_id(params[:id])
    end

end

# create_table "workouts", force: :cascade do |t|
#     t.string "content"
#     t.datetime "date"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.string "title"