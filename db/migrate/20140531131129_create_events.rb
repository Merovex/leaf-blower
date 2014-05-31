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
      t.datetime :start
      t.datetime :finish
      t.text :description

      t.timestamps
    end
  end
end
