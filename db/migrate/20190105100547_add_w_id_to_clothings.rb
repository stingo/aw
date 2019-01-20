class AddWIdToClothings < ActiveRecord::Migration[5.2]
  def change
    add_column :clothings, :w_id, :integer
    add_index :clothings, :w_id
  end
end
