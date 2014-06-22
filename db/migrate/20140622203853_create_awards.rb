class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.references :boy, index: true
      t.references :badge, index: true
      t.integer :progress
      t.date :completed_on

      t.timestamps
    end
  end
end
