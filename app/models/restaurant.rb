class Restaurant < ApplicationRecord
  belongs_to :use
  validates :name, presence: true
  validates :cuisine
  validates :address, presence: true
  has_many :bookings
end
