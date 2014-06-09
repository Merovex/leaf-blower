class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.text :description
      t.integer :heritage
      t.integer :hobbies
      t.integer :outdoor_activities
      t.integer :pioneer_skills
      t.integer :sci_tech
      t.integer :life_skills
      t.integer :values
      t.integer :life_skills
      t.integer :service
      t.string :rank

      t.timestamps
    end
  end
end
