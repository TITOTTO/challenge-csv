class CreateEmbassies < ActiveRecord::Migration[7.0]
  def change
    create_table :embassies do |t|
      t.string :building
      t.string :latitude
      t.string :longitude
      t.string :contact
      t.belongs_to :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
