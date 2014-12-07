class RemoveGraceFromBoys < ActiveRecord::Migration
  def change
    remove_column :boys, :grace, :integer
  end
end
