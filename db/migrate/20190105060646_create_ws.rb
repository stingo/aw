class CreateWs < ActiveRecord::Migration[5.2]
  def change
    create_table :ws do |t|
      t.string :name

      t.timestamps
    end
  end
end
