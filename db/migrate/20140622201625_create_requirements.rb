class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :name
      t.text :text
      t.references :badge, index: true

      t.timestamps
    end
  end
end
