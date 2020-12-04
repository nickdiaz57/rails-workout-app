class Workout < ApplicationRecord
    has_many :reservations
    has_many :users, through: :reservations
    validates :content, presence: true
    validates :date, presence: true
    validates :title, presence: true

    def format_date_time
        self.date.strftime("%B %e, %Y %l:%M %p")
    end

    def format_date
        self.date.strftime("%B %e, %Y")
    end

    def format_time
        self.date.strftime("%l:%M %p")
    end

    def format_name
        "#{self.format_date_time} - '#{self.title}'"
    end
end
