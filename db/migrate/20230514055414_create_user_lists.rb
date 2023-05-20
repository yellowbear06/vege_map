class CreateUserLists < ActiveRecord::Migration[7.0]
  def change
    create_table :user_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :list_name, null:false
      t.text :description

      t.timestamps
    end
  end
end
