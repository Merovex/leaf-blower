class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :rank, index: true
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
