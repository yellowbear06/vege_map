class CreatePlaceOfVegetarianTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :place_of_vegetarian_types do |t|
      t.references :place, null: false, foreign_key: true
      t.integer :option
      t.references :vegetarian_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
