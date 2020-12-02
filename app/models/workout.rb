class Workout < ApplicationRecord
    has_many :reservations
    has_many :users, through: :reservations
    validates :content, presence: true

    def format_time
    end
end
