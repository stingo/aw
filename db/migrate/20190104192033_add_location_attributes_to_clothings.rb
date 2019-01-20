class AddLocationAttributesToClothings < ActiveRecord::Migration[5.2]
  def change
  	add_column :clothings, :longitude, :float
  	add_column :clothings, :latitude, :float
  	add_column :clothings, :local_area, :string
  	add_column :clothings, :area_code, :string
  	add_column :clothings, :town, :string
  	add_column :clothings, :country, :string
  end
end






