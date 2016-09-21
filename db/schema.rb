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

ActiveRecord::Schema.define(version: 20160921222700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.integer  "award_id"
    t.integer  "requirement_id"
    t.date     "completed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "achievements", ["award_id"], name: "index_achievements_on_award_id", using: :btree
  add_index "achievements", ["requirement_id"], name: "index_achievements_on_requirement_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id"
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "attendances", force: :cascade do |t|
    t.integer  "boy_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank_id"
  end

  add_index "attendances", ["boy_id"], name: "index_attendances_on_boy_id", using: :btree
  add_index "attendances", ["event_id"], name: "index_attendances_on_event_id", using: :btree
  add_index "attendances", ["rank_id"], name: "index_attendances_on_rank_id", using: :btree

  create_table "awards", force: :cascade do |t|
    t.integer  "boy_id"
    t.integer  "badge_id"
    t.integer  "progress"
    t.date     "completed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "awards", ["badge_id"], name: "index_awards_on_badge_id", using: :btree
  add_index "awards", ["boy_id"], name: "index_awards_on_boy_id", using: :btree

  create_table "badges", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "slug",        limit: 255
    t.text     "description"
    t.string   "rank",        limit: 255
    t.boolean  "active",                  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bonums", force: :cascade do |t|
    t.integer  "boy_id"
    t.integer  "rank_id"
    t.string   "name",               limit: 255
    t.integer  "reported_by"
    t.string   "summary",            limit: 255
    t.integer  "service"
    t.integer  "heritage"
    t.integer  "hobbies"
    t.integer  "life_skills"
    t.integer  "outdoor_activities"
    t.integer  "pioneer_skills"
    t.integer  "sci_tech"
    t.integer  "values"
    t.integer  "nights"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bonums", ["boy_id"], name: "index_bonums_on_boy_id", using: :btree
  add_index "bonums", ["rank_id"], name: "index_bonums_on_rank_id", using: :btree

  create_table "boys", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "slug",            limit: 255
    t.string   "type",            limit: 255
    t.integer  "current_rank_id"
    t.integer  "patrol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "grade",                       default: 0
    t.boolean  "active",                      default: true
    t.datetime "promoted_at"
    t.date     "medical_on"
  end

  create_table "event_series", force: :cascade do |t|
    t.integer  "frequency",              default: 1
    t.string   "period",     limit: 255, default: "monthly"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "location_id"
    t.integer  "service",                        default: 0
    t.integer  "heritage",                       default: 0
    t.integer  "hobbies",                        default: 0
    t.integer  "life_skills",                    default: 0
    t.integer  "outdoor_activities",             default: 0
    t.integer  "pioneer_skills",                 default: 0
    t.integer  "sci_tech",                       default: 0
    t.integer  "values",                         default: 0
    t.integer  "nights",                         default: 0
    t.boolean  "all_day",                        default: false
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "event_series_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "events", ["deleted_at"], name: "index_events_on_deleted_at", using: :btree
  add_index "events", ["event_series_id"], name: "index_events_on_event_series_id", using: :btree
  add_index "events", ["location_id"], name: "index_events_on_location_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "address",    limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packs", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "packs", ["location_id"], name: "index_packs_on_location_id", using: :btree

  create_table "patrols", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "rank",       limit: 255
    t.integer  "pack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patrols", ["pack_id"], name: "index_patrols_on_pack_id", using: :btree

  create_table "ranks", force: :cascade do |t|
    t.string   "name",               limit: 255
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
    t.integer  "nights"
    t.date     "start"
    t.date     "finish"
    t.date     "awarded"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "grace",                          default: 0
    t.date     "joining_on"
    t.date     "joining_tt_on"
    t.integer  "joining_tt_by"
    t.date     "heritage_on"
    t.date     "heritage_tt_on"
    t.integer  "heritage_tt_by"
    t.date     "hobbies_on"
    t.date     "hobbies_tt_on"
    t.integer  "hobbies_tt_by"
    t.date     "life_on"
    t.date     "life_tt_on"
    t.integer  "life_tt_by"
    t.date     "outdoor_on"
    t.date     "outdoor_tt_on"
    t.integer  "outdoor_tt_by"
    t.date     "pioneer_on"
    t.date     "pioneer_tt_on"
    t.integer  "pioneer_tt_by"
    t.date     "science_on"
    t.date     "science_tt_on"
    t.integer  "science_tt_by"
    t.date     "values_on"
    t.date     "values_tt_on"
    t.integer  "values_tt_by"
    t.string   "heritage_type",      limit: 255, default: ""
    t.string   "hobbies_type",       limit: 255, default: ""
    t.string   "life_type",          limit: 255, default: ""
    t.string   "outdoor_type",       limit: 255, default: ""
    t.string   "pioneer_type",       limit: 255, default: ""
    t.string   "science_type",       limit: 255, default: ""
    t.string   "values_type",        limit: 255, default: ""
    t.date     "forest_on"
    t.date     "forest_tt_on"
    t.integer  "forest_tt_by"
  end

  add_index "ranks", ["boy_id"], name: "index_ranks_on_boy_id", using: :btree

  create_table "requirements", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "text"
    t.integer  "badge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requirements", ["badge_id"], name: "index_requirements_on_badge_id", using: :btree

  create_table "templates", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description"
    t.integer  "heritage"
    t.integer  "hobbies"
    t.integer  "outdoor_activities"
    t.integer  "pioneer_skills"
    t.integer  "sci_tech"
    t.integer  "life_skills"
    t.integer  "values"
    t.integer  "service"
    t.string   "rank",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
