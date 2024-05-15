class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :cuisine, presence: true
  validates :details, presence: true
end
