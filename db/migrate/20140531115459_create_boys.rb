class CreateBoys < ActiveRecord::Migration
  def change
    create_table :boys do |t|
      t.string :name
      t.string :slug
      t.string :type
      t.references :current_rank, index: false
      t.references :patrol, index: false

      t.timestamps
    end
  end
end
