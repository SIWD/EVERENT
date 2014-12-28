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

ActiveRecord::Schema.define(version: 20141228125709) do

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "music_types", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "musician_music_types", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "musicians", force: true do |t|
    t.boolean  "hasEquipment"
    t.integer  "musicianType"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "gender"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "city"
    t.string   "postcode"
    t.string   "streetname"
    t.string   "housenumber"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "services", force: true do |t|
    t.text     "description"
    t.integer  "maxCapacity"
    t.string   "name"
    t.date     "premiumServiceEnd"
    t.string   "teaser"
    t.integer  "Business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["Business_id"], name: "index_services_on_Business_id"

  create_table "user_businesses", force: true do |t|
    t.string   "position"
    t.integer  "User_id"
    t.integer  "Business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_businesses", ["Business_id"], name: "index_user_businesses_on_Business_id"
  add_index "user_businesses", ["User_id"], name: "index_user_businesses_on_User_id"

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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "welcomes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
