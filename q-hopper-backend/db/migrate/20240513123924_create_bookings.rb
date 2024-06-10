class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.boolean :join, default: false
      t.boolean :accepted, default: false
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
