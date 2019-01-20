class AddUserIdToClothings < ActiveRecord::Migration[5.2]
  def change
    add_column :clothings, :user_id, :integer
    add_column :clothings, :slug, :string




    add_index :clothings, :user_id
    add_index :clothings, :slug
  end
end
