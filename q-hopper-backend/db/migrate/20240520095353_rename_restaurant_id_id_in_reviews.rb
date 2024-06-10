class RenameRestaurantIdIdInReviews < ActiveRecord::Migration[7.1]
  def change
    rename_column :reviews, :restaurant_id_id, :restaurant_id
  end
end
