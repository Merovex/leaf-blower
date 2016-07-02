class AddForestToRank < ActiveRecord::Migration
  def change
    add_column :ranks, :forest_on, :date
    add_column :ranks, :forest_tt_on, :date
    add_column :ranks, :forest_tt_by, :integer
  end
end
