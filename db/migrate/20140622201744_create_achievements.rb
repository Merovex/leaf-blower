class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.references :award, index:true
      t.references :requirement, index: true
      t.date :completed_on

      t.timestamps
    end
  end
end
