class AddCurrencyToClothings < ActiveRecord::Migration[5.2]
  def change
    add_column :clothings, :currency, :string
  end
end
