class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :location, index: true
      t.integer :service
      t.integer :heritage
      t.integer :hobbies
      t.integer :hobbies
      t.integer :life_skills
      t.integer :outdoor_activities
      t.integer :pioneer_skills
      t.integer :sci_tech
      t.integer :values
      t.boolean :all_day, :default => false
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer  :event_series_id
      t.text :description

      t.timestamps
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

  add_index "events", ["event_series_id"], name: "index_events_on_event_series_id", using: :btree

  end
end
