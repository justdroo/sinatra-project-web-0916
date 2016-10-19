class AddRatingColumn < ActiveRecord::Migration
  def change
    add_column :businesses , :rating, :integer
  end
end
