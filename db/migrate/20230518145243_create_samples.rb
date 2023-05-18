class CreateSamples < ActiveRecord::Migration[7.0]
  def change
    create_table :samples do |t|
      t.string :name
      t.string :english_name
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
