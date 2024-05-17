class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :restaurant_id
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
