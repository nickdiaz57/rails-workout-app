class Reservation < ApplicationRecord
    belongs_to :workout
    belongs_to :user

    scope :past_reservations, ->(user_id) {joins(:workout).where(user_id: user_id).where("workouts.date < ?", DateTime.now)}
    scope :future_reservations, ->(user_id) {joins(:workout).where(user_id: user_id).where("workouts.date > ?", DateTime.now)}
end
