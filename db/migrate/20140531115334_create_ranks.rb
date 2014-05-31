class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :name
      t.references :boy, index: true
      t.boolean :is_current
      t.integer :service
      t.integer :heritage
      t.integer :hobbies
      t.integer :life_skills
      t.integer :outdoor_activities
      t.integer :pioneer_skills
      t.integer :sci_tech
      t.integer :values
      t.date :start
      t.date :finish
      t.date :awarded

      t.timestamps
    end
  end
end
