class ReservationsController < ApplicationController
    def index
        @user = User.find_by_id(params[:user_id])
        @reservations = Reservation.past_reservations(@user.id)
    end
    
    def show
        @reservation = Reservation.find_by_id(params[:id])
        @users = @reservation.workout.users
    end
    
    def new
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to "/", alert: "User not found."
          else
            @reservation = Reservation.new(user_id: params[:user_id])
            @workouts = Workout.all.select {|w| w.date.to_date.future?}
        end
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            flash[:alert] = "Reservation successfully created!"
            redirect_to user_path(@reservation.user)
        else
            flash[:alert] = "An error occurred. Please try again."
            render :new # add error message
        end
    end
 
    def edit
        # byebug
        if params[:user_id]
            user = User.find_by_id(params[:user_id])
            if user.nil?
                redirect_to "/", alert: "User not found."
            else
                @reservation = user.reservations.find_by_id(params[:id])
                @workouts = Workout.all
                redirect_to to user_reservations_path(user), alert: "Reservation not found." if @reservation.nil?
            end
        else
            redirect_to "/", alert: "User not found."
        end
    end

    def update
        @reservation = Reservation.find_by_id(params[:id])
        @reservation.update(reservation_params)

        if @reservation.save
            flash[:alert] = "Reservation successfully updated!"
            redirect_to user_reservations_path(@reservation.user)
        else
            flash[:alert] = "An error occurred. Please try again."
            render :edit
        end
    end

    def destroy
        # byebug
        reservation = Reservation.find_by_id(params[:id])
        user = reservation.user
        reservation.destroy
        redirect_to user_reservations_path(user)
    end

    private

    def reservation_params
        params.require(:reservation).permit(:score, :user_id, :workout_id)
    end
end