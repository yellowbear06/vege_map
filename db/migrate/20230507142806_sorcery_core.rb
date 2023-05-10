class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name,             null: false
      t.string :email,            null: false
      t.string :profile
      t.string :address
      t.string :avatar
      t.integer :role,           null: false, default: 0
      t.string :crypted_password
      t.string :salt
      t.references :vegetarian_type, foreign_key: true

      t.timestamps                null: false
    end

    add_index :users, :email, unique: true
  end
end
