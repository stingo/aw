class AddFashionIdToClothings < ActiveRecord::Migration[5.2]
  def change
    add_column :clothings, :fashion_id, :integer
    add_index :clothings, :fashion_id
  end
end
