class User < ApplicationRecord
    has_secure_password
    has_many :reservations
    has_many :workouts, through: :reservations

    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true

    def name
        "#{self.first_name} #{self.last_name}"
    end

    def past_workouts
        self.workouts.select {|w| w.date.to_date.past?}
    end

    def future_workouts
        self.workouts.select {|w| w.date.to_date.future?}
    end
end
