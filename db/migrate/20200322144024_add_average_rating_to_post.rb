class AddAverageRatingToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :avg_rating, :float,  null: false, default: 0
  end
end
