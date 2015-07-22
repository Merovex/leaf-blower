class FixRoleToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
	  t.change :role, :integer, default: 0
	end
	User.reset_column_information
	User.update_all(role: 0)
  end
end