# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140327211812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "van_id"
    t.string   "image"
  end

  add_index "images", ["van_id"], name: "index_images_on_van_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "street"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "van_id"
  end

  add_index "locations", ["van_id"], name: "index_locations_on_van_id", using: :btree

  create_table "vans", force: true do |t|
    t.string   "brand"
    t.string   "model"
    t.integer  "year"
    t.decimal  "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
