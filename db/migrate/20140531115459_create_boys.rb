class CreateBoys < ActiveRecord::Migration
  def change
    create_table :boys do |t|
      t.string :name
      t.references :current_rank, index: false
      t.references :patrol, index: false

      t.timestamps
    end
  end
end
