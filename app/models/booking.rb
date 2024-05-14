class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :accepted, presence: true
  validates :completed, presence: true
end
