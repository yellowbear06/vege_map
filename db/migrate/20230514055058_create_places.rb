class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name, null:false
      t.string :eng_name
      t.string :address
      t.string :eng_address
      t.string :phone
      t.string :google_place_id
      t.string :category

      t.timestamps
    end
    add_index :places, :google_place_id, unique: true
  end
end
