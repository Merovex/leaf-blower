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

ActiveRecord::Schema.define(version: 20140531131129) do

  create_table "attendances", force: true do |t|
    t.integer  "boy_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["boy_id"], name: "index_attendances_on_boy_id"
  add_index "attendances", ["event_id"], name: "index_attendances_on_event_id"

  create_table "boys", force: true do |t|
    t.string   "name"
    t.integer  "current_rank_id"
    t.integer  "patrol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_series", force: true do |t|
    t.integer  "frequency",  default: 1
    t.string   "period",     default: "monthly"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.integer  "service"
    t.integer  "heritage"
    t.integer  "hobbies"
    t.integer  "life_skills"
    t.integer  "outdoor_activities"
    t.integer  "pioneer_skills"
    t.integer  "sci_tech"
    t.integer  "values"
    t.boolean  "all_day",            default: false
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "event_series_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["event_series_id"], name: "index_events_on_event_series_id"
  add_index "events", ["location_id"], name: "index_events_on_location_id"

  create_table "locations", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packs", force: true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "packs", ["location_id"], name: "index_packs_on_location_id"

  create_table "patrols", force: true do |t|
    t.string   "name"
    t.string   "rank"
    t.integer  "pack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patrols", ["pack_id"], name: "index_patrols_on_pack_id"

  create_table "ranks", force: true do |t|
    t.string   "name"
    t.integer  "boy_id"
    t.boolean  "is_current"
    t.integer  "service"
    t.integer  "heritage"
    t.integer  "hobbies"
    t.integer  "life_skills"
    t.integer  "outdoor_activities"
    t.integer  "pioneer_skills"
    t.integer  "sci_tech"
    t.integer  "values"
    t.date     "start"
    t.date     "finish"
    t.date     "awarded"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ranks", ["boy_id"], name: "index_ranks_on_boy_id"

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
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
