class Embassy < ApplicationRecord
  validates :building,
              presence: true
  validates :longitude,
              presence: true
  validates :latitude,
              presence: true
  validates :contact,
              presence: true

  belongs_to :country
end
