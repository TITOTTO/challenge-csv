class Country < ApplicationRecord
  has_one :embassy
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
