class MakePatrolNotNull < ActiveRecord::Migration
  def change
  	# change_column :boys, :patrol_id, :integer, null: false, default: 1
  	change_column_null(:boys, :patrol_id, true, 1)
  end
end
