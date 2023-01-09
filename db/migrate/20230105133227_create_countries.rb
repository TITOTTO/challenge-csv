class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :country_fr
      t.string :country_en
      t.integer :iso_numerical
      t.string :iso_alpha2
      t.string :iso_alpha3

      t.timestamps
    end
  end
end
