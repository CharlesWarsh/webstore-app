class CreateCategoryTags < ActiveRecord::Migration
  def change
    create_table :category_tags do |t|
      t.integer :product_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
