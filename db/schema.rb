# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_28_131543) do
  create_table "events", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "place_id"
    t.string "name", null: false
    t.text "description"
    t.string "event_url"
    t.datetime "start_time", null: false
    t.datetime "end_time"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_events_on_place_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "list_places", force: :cascade do |t|
    t.integer "user_list_id", null: false
    t.integer "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_list_places_on_place_id"
    t.index ["user_list_id"], name: "index_list_places_on_user_list_id"
  end

  create_table "place_of_vegetarian_types", force: :cascade do |t|
    t.integer "place_id", null: false
    t.integer "option"
    t.integer "vegetarian_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_place_of_vegetarian_types_on_place_id"
    t.index ["vegetarian_type_id"], name: "index_place_of_vegetarian_types_on_vegetarian_type_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name", null: false
    t.string "eng_name"
    t.string "address"
    t.string "eng_address"
    t.string "phone"
    t.string "google_place_id"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["google_place_id"], name: "index_places_on_google_place_id", unique: true
  end

  create_table "user_lists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "list_name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "profile"
    t.string "address"
    t.string "avatar"
    t.integer "role", default: 0, null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "vegetarian_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["vegetarian_type_id"], name: "index_users_on_vegetarian_type_id"
  end

  create_table "vegetarian_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "places"
  add_foreign_key "events", "users"
  add_foreign_key "list_places", "places"
  add_foreign_key "list_places", "user_lists"
  add_foreign_key "place_of_vegetarian_types", "places"
  add_foreign_key "place_of_vegetarian_types", "vegetarian_types"
  add_foreign_key "user_lists", "users"
  add_foreign_key "users", "vegetarian_types"
end
