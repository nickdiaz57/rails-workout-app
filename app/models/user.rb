class User < ApplicationRecord
    has_secure_password
    has_many :reservations
    has_many :workouts, through: :reservations
end
