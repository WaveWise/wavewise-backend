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

ActiveRecord::Schema.define(version: 2018_10_02_204752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.bigint "spot_id"
    t.integer "swell_period_s"
    t.integer "swell_height_ft"
    t.string "swell_direction"
    t.integer "wind_speed_mph"
    t.string "wind_direction"
    t.string "tide"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_conditions_on_spot_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "coordinates"
    t.string "shore_angle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "conditions", "spots"
end
