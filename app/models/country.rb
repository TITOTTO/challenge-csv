class Country < ApplicationRecord
  validates :country_fr, 
              presence: true, 
              format: { with: /\A[a-zA-Z]+\z/, message: "Seul des lettres sont autorisées" }
  validates :iso_numerical,
              presence: true,
              numericality: { only_integer: true, message: "Le champs Iso Numérique doit être un nombre" }
  validates :iso_alpha2,
              presence: true,
              length: { is: 2, message: "Ce champ doit être rempli avec %{count} caractères" }
  validates :iso_alpha3,
              presence: true,
              length: { is: 3, message: "Ce champ doit être rempli avec %{count} caractères" }

  has_one :embassy, dependent: :restrict_with_error
  has_many :french_foreigners

  def embassy?
    return true if self.embassy.present?

    return false
  end

  def french_foreigners?
    return true if self.french_foreigners.present?

    return false
  end
end
