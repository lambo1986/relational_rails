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

ActiveRecord::Schema[7.0].define(version: 2023_11_30_143755) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Musicians", id: :integer, default: nil, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "name"
    t.integer "age"
    t.text "genre"
    t.boolean "active"
  end

  create_table "Synthesizers", id: :integer, default: nil, force: :cascade do |t|
    t.integer "musician_id", null: false
    t.text "created_at"
    t.text "updated_at"
    t.text "brand"
    t.text "name"
    t.integer "year"
    t.text "engine"
    t.integer "value"
    t.integer "voices"
    t.boolean "vintage"
  end

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "genre"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "synthesizers", force: :cascade do |t|
    t.integer "musician_id"
    t.string "brand"
    t.string "name"
    t.integer "year"
    t.string "engine"
    t.integer "value"
    t.integer "voice_count"
    t.boolean "vintage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "Synthesizers", "Musicians", column: "musician_id", name: "Synthesizers_musician_id_fkey"
end
