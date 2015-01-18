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

ActiveRecord::Schema.define(version: 20150116222825) do

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
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "service_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_sub_categories", force: true do |t|
    t.string   "name"
    t.integer  "serviceCategories_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_sub_categories", ["serviceCategories_id"], name: "index_service_sub_categories_on_serviceCategories_id"

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "teaser"
    t.text     "description"
    t.integer  "business_id"
    t.integer  "serviceSubCategory_id"
    t.integer  "branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["branch_id"], name: "index_services_on_branch_id"
  add_index "services", ["business_id"], name: "index_services_on_business_id"
  add_index "services", ["serviceSubCategory_id"], name: "index_services_on_serviceSubCategory_id"

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

end
