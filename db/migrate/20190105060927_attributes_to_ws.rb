class AttributesToWs < ActiveRecord::Migration[5.2]
  def change
  	add_column :ws, :slug, :string
  	add_column :ws, :description, :text
  	add_column :ws, :ancestry, :string
  	add_column :ws, :user_id, :integer

  	add_index :ws, :user_id


  end
end


