class AddGraceToBoys < ActiveRecord::Migration
  def change
    add_column :boys, :grace, :integer, :default => 0
  end
end
