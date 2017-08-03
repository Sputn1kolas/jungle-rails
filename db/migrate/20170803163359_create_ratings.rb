class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.string :user_id
      t.string :product_id
      t.string :description
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
