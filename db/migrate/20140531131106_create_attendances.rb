class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :boy, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
