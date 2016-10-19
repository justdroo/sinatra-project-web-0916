class AddColumnBusinessesImages < ActiveRecord::Migration
  def change
    add_column :businesses , :rating_img, :string
  end
end
