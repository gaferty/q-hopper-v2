class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :accepted, default: false
  validates :completed, default: false
end
