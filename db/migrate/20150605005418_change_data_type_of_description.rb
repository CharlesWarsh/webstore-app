class ChangeDataTypeOfDescription < ActiveRecord::Migration
  def change
    change_column :products, :description, :text
    add_column :products, :in_stock, :boolean
  end
end
