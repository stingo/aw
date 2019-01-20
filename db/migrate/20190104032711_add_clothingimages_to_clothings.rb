class AddClothingimagesToClothings < ActiveRecord::Migration[5.2]
  def change
    add_column :clothings, :clothingimages, :jsonb
  end
end
