class AddAverageRatingToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :average_rating, :float, default: 0.0
  end
end
