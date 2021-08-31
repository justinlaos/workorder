# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_23_002046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.integer "order_status", default: 0
    t.integer "order_type", default: 0
    t.string "description"
    t.bigint "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_orders_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "property_type"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "price"
    t.string "bed_rooms"
    t.string "bath_rooms"
    t.string "square_feet"
    t.string "lot_size"
    t.string "year_built"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.boolean "selected", default: false, null: false
    t.string "time_est"
    t.string "price_est"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_quotes_on_order_id"
  end

  add_foreign_key "orders", "properties"
  add_foreign_key "quotes", "orders"
end
