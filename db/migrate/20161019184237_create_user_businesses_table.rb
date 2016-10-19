class CreateUserBusinessesTable < ActiveRecord::Migration
  def change
    create_table :user_businesses do |t|
      t.integer :user_id
      t.integer :business_id
    end
  end
end
