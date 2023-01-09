class CreateFrenchForeigners < ActiveRecord::Migration[7.0]
  def change
    create_table :french_foreigners do |t|
      t.integer :year
      t.integer :nbr_fr
      t.belongs_to :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
