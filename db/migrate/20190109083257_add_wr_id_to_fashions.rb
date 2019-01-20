class AddWrIdToFashions < ActiveRecord::Migration[5.2]
  def change
    add_column :fashions, :w_id, :integer
    add_index :fashions, :w_id
  end
end
