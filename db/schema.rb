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

ActiveRecord::Schema.define(version: 20150217131421) do

  create_table "addresses", force: true do |t|
    t.string   "city"
    t.string   "zipcode"
    t.string   "streetName"
    t.string   "streetNumber"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "lat"
    t.float    "lng"
    t.string   "stateCode"
    t.string   "country"
  end

  create_table "branch_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "branches", force: true do |t|
    t.string   "name"
    t.integer  "branchCategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branches", ["branchCategory_id"], name: "index_branches_on_branchCategory_id"

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "address_id"
  end

  add_index "businesses", ["address_id"], name: "index_businesses_on_address_id"

  create_table "event_businesses", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "event_user_status_id"
    t.integer  "event_user_join_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_businesses", ["event_id"], name: "index_event_businesses_on_event_id"
  add_index "event_businesses", ["event_user_join_id"], name: "index_event_businesses_on_event_user_join_id"
  add_index "event_businesses", ["event_user_status_id"], name: "index_event_businesses_on_event_user_status_id"
  add_index "event_businesses", ["user_id"], name: "index_event_businesses_on_user_id"

  create_table "event_images", force: true do |t|
    t.string   "album"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "event_images", ["event_id"], name: "index_event_images_on_event_id"

  create_table "event_locations", force: true do |t|
    t.string   "name"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_locations", ["address_id"], name: "index_event_locations_on_address_id"

  create_table "event_services", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "event_user_status_id"
    t.integer  "event_user_join_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_services", ["event_id"], name: "index_event_services_on_event_id"
  add_index "event_services", ["event_user_join_id"], name: "index_event_services_on_event_user_join_id"
  add_index "event_services", ["event_user_status_id"], name: "index_event_services_on_event_user_status_id"
  add_index "event_services", ["user_id"], name: "index_event_services_on_user_id"

  create_table "event_user_joins", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_user_statuses", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_users", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "event_user_status_id"
    t.integer  "event_user_join_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_users", ["event_id"], name: "index_event_users_on_event_id"
  add_index "event_users", ["event_user_join_id"], name: "index_event_users_on_event_user_join_id"
  add_index "event_users", ["event_user_status_id"], name: "index_event_users_on_event_user_status_id"
  add_index "event_users", ["user_id"], name: "index_event_users_on_user_id"

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.time     "time"
    t.integer  "event_location_id"
    t.integer  "who_has_access_id"
    t.string   "password"
  end

  add_index "events", ["event_location_id"], name: "index_events_on_event_location_id"
  add_index "events", ["who_has_access_id"], name: "index_events_on_who_has_access_id"

  create_table "locations", force: true do |t|
    t.string   "city"
    t.string   "zipcode"
    t.float    "lat"
    t.float    "lng"
    t.string   "stateCode"
    t.string   "country"
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
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "address_id"
  end

  add_index "profiles", ["address_id"], name: "index_profiles_on_address_id"
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "teaser"
    t.text     "description"
    t.integer  "business_id"
    t.integer  "branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["branch_id"], name: "index_services_on_branch_id"
  add_index "services", ["business_id"], name: "index_services_on_business_id"

  create_table "user_businesses", force: true do |t|
    t.string   "position"
    t.integer  "user_id"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_businesses", ["business_id"], name: "index_user_businesses_on_business_id"
  add_index "user_businesses", ["user_id"], name: "index_user_businesses_on_user_id"

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

  create_table "who_has_access_to_events", force: true do |t|
    t.string   "who"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
