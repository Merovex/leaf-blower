class ChangeRoleToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
	  t.change :role, :string
	end
  end
end
