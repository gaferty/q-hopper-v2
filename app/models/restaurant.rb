class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :use
  validates :name, presence: true
  validates :cuisine, presence: true
  validates :address, presence: true
  has_many :bookings
end
