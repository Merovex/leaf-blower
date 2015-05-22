class AddGradeToBoys < ActiveRecord::Migration
  def change
  	add_column :boys, :grade, :integer, :default => 0
  	add_column :boys, :active, :boolean, :default => 1
  end
end
