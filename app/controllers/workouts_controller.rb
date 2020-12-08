class WorkoutsController < ApplicationController
    before_action :current_workout, except: [:index, :new, :create]

    def index
        @workouts = Workout.all
    end

    def show
    end

    def new
        @workout = Workout.new
    end

    def create
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
    end

    def update
        # add partial for new and edit forms
        if @workout.update(workout_params)
            redirect_to workout_path(@workout)
        else
            # add error message
            render :edit
        end
    end

    def destroy
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