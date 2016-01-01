class ReviseBonums < ActiveRecord::Migration
  def change
  	remove_column :bonums, :earned_on, :date
  	change_column :bonums, :reported_by, :integer#, index: true
  	# add_foreign_key :bonums, :users, column: :reported_by
  end
end
