class CreateBonums < ActiveRecord::Migration
  def change
    create_table :bonums do |t|
      t.references :boy, index: true
      t.references :rank, index: true
      t.string :name
      t.string :reported_by
      t.string :summary
      t.date :earned_on
      t.integer :service
      t.integer :heritage
      t.integer :hobbies
      t.integer :life_skills
      t.integer :outdoor_activities
      t.integer :pioneer_skills
      t.integer :sci_tech
      t.integer :values
      t.integer :nights

      t.timestamps
    end
  end
end
