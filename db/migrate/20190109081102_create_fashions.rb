class CreateFashions < ActiveRecord::Migration[5.2]
  def change
    create_table :fashions do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.string :fashionimage

      t.timestamps
    end
  end
end
