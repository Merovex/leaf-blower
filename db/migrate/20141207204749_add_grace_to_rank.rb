class AddGraceToRank < ActiveRecord::Migration
  def change
    add_column :ranks, :grace, :integer, :default => 0
  end
end
