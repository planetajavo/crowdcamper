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

ActiveRecord::Schema.define(version: 20140401134432) do

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

  create_table "rentals", force: true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "van_id"
  end

  add_index "rentals", ["user_id"], name: "index_rentals_on_user_id", using: :btree
  add_index "rentals", ["van_id"], name: "index_rentals_on_van_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vans", force: true do |t|
    t.string   "brand"
    t.string   "model"
    t.integer  "year"
    t.decimal  "price"
    t.text     "description"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "vans", ["user_id"], name: "index_vans_on_user_id", using: :btree

end
