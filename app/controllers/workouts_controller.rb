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
        workout = Workout.new(workout_params)
        if workout.save
            flash[:alert] = "Workout successfully created!"
            workout.users << User.find_by_id(session[:user_id])
            redirect_to workout_path(workout)
        else
            flash[:alert] = "There was an error creating the workout. Please try again."
            render :new
        end
    end

    def edit
    end

    def update
        if @workout.update(workout_params)
            flash[:alert] = "Workout successfully updated!"
            redirect_to workout_path(@workout)
        else
            flash[:alert] = "There was an error editing the workout. Please try again."
            render :edit
        end
    end

    def destroy
        @workout.destroy
        redirect_to workouts_path
    end

    private

    def workout_params
        params.require(:workout).permit(:title, :content, :date, :user_id)
    end

    def current_workout
        @workout = Workout.find_by_id(params[:id])
    end

end