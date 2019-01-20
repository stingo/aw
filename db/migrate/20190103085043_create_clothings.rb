class CreateClothings < ActiveRecord::Migration[5.2]
  def change
    create_table :clothings do |t|
      t.string :name
      t.text :overview

      t.timestamps
    end
  end
end
