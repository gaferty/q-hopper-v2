class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :cuisine
      t.integer :rating
      t.string :details
      t.string :address, null: false
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
