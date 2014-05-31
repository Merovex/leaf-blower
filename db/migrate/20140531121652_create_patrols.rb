class CreatePatrols < ActiveRecord::Migration
  def change
    create_table :patrols do |t|
      t.string :name
      t.string :rank
      t.references :pack, index: true

      t.timestamps
    end
  end
end
