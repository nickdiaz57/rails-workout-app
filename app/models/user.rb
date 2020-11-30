class User < ApplicationRecord
    has_secure_password
    has_many :reservations
    has_many :workouts, through: :reservations

    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true

end
