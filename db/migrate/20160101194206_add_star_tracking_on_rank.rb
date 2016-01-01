class AddStarTrackingOnRank < ActiveRecord::Migration
  def change
  	add_column :ranks, :heritage_type, :string, :default => ""
  	add_column :ranks, :hobbies_type, :string, :default => ""
	add_column :ranks, :life_type, :string, :default => ""
	add_column :ranks, :outdoor_type, :string, :default => ""
	add_column :ranks, :pioneer_type, :string, :default => ""
	add_column :ranks, :science_type, :string, :default => ""
	add_column :ranks, :values_type, :string, :default => ""
  end
end
