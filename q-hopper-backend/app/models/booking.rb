class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :user, presence: true
end
