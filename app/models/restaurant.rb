class Restaurant < ApplicationRecord
  belongs_to :use
  has_many :bookings
  validates :name, presence: true
  validates :cuisine, presence: true
  validates :address, presence: true
end
