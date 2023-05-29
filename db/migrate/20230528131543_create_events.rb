class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :place, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.string :event_url
      t.datetime :start_time, null:false
      t.datetime :end_time
      t.integer :status, default:0, null:false

      t.timestamps
    end
  end
end