class User < ApplicationRecord
    has_many :reservations
    has_many :workouts, through: :reservations
end
