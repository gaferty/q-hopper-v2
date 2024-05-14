class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :use
  has_many :bookings
  validates :name, presence: true
  validates :cuisine, presence: true
  validates :cuisine, presence: true
  validates :address, presence: true
end
