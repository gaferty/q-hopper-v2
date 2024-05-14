class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  # validates :accepted
  # validates :completed
end
