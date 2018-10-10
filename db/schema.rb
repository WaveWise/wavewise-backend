# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_09_152513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "condition_ratings", force: :cascade do |t|
    t.bigint "spot_id"
    t.uuid "user"
    t.integer "rating"
    t.string "condition_swell_period_s"
    t.string "condition_swell_height_ft"
    t.string "condition_swell_direction"
    t.string "condition_wind_speed_mph"
    t.string "condition_wind_direction"
    t.string "condition_tide_type"
    t.string "condition_tide_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_condition_ratings_on_spot_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.bigint "spot_id"
    t.string "swell_period_s"
    t.string "swell_height_ft"
    t.string "swell_direction"
    t.string "wind_speed_mph"
    t.string "wind_direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tide_type"
    t.string "tide_time"
    t.index ["spot_id"], name: "index_conditions_on_spot_id"
  end

  create_table "spot_ratings", force: :cascade do |t|
    t.bigint "spot_id"
    t.uuid "user"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_spot_ratings_on_spot_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "coordinates"
    t.string "shore_angle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "condition_ratings", "spots"
  add_foreign_key "conditions", "spots"
  add_foreign_key "spot_ratings", "spots"
end
