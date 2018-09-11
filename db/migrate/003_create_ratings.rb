class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|

      t.belongs_to :user
      t.belongs_to :spot
      t.integer :score
      t.string :review_title
      t.text :review_body

      t.timestamps
    end
  end
end
