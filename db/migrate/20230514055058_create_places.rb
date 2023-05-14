class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name, null:false
      t.string :address
      t.text :description
      t.string :map_url, null:false

      t.timestamps
    end
    add_index :places, :map_url, unique: true
  end
end
