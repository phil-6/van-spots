class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|

      t.belongs_to :user
      t.integer :score
      t.string :created_by
      t.string :review_title
      t.text :review_body
      t.references :spot, foreign_key: true

      t.timestamps
    end
  end
end
