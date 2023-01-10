class FrenchForeigner < ApplicationRecord
  validates :year,
              presence: true,
              numericality: { only_integer: true, message: "Ce champs doit être une année" }
  validates :nbr_fr,
              presence: true,
              numericality: { only_integer: true, message: "Ce champs doit être un nombre" }

  belongs_to :country
end
