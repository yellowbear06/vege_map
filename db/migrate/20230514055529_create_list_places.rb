class CreateListPlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :list_places do |t|
      t.references :user_list, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
