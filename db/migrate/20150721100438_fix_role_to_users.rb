class FixRoleToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
	  # t.change :role, :integer, default: 0
	  t.change :role, :integer, 'integer USING CAST(column_name AS integer)'
	end
	User.reset_column_information
	# User.update_all(role: 0)
  end
end
