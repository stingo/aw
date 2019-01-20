class AddOtherattributesToClothings < ActiveRecord::Migration[5.2]
  def change
  	add_column :clothings, :price, :integer
  	add_column :clothings, :video_link, :string
  	add_column :clothings, :listing_token, :string
  	add_column :clothings, :stock, :string
  	add_column :clothings, :website_url, :string
  end
end
