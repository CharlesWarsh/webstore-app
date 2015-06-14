class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :price
      t.string :image
      t.string :description
      t.string :key_points

      t.timestamps null: false
    end
  end
end
