class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.decimal :price, precision: 8, scale: 2
      t.string :image
      t.string :description
      t.string :key_points

      t.timestamps null: false
    end
  end
end
