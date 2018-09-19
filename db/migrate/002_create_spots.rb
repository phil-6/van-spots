class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|

      t.belongs_to :user
      t.string :name
      t.text :description
      t.string :spot_type
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.string :web_link

      t.timestamps
    end
  end
end
