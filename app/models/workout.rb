class Workout < ApplicationRecord
    has_many :reservations
    has_many :users, through: :reservations
    validates :content, presence: true
    validates :date, presence: true
    # add name to workouts

    def format_date_time
        self.date.strftime("%B %e, %Y %l:%M %p")
    end

    def format_time
        self.date.strftime("%l:%M %p")
    end
end
