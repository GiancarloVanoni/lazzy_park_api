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

ActiveRecord::Schema.define(version: 20170414203757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "pins", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "latitude",   default: 0.0, null: false
    t.float    "longitude",  default: 0.0, null: false
    t.integer  "status"
    t.index ["latitude"], name: "index_pins_on_latitude", using: :btree
    t.index ["longitude"], name: "index_pins_on_longitude", using: :btree
  end

  create_table "subpins", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.float    "latitude",            default: 0.0, null: false
    t.float    "longitude",           default: 0.0, null: false
    t.float    "speed",               default: 0.0, null: false
    t.integer  "user_id"
    t.integer  "activity_type"
    t.integer  "activity_confidence"
  end

end
