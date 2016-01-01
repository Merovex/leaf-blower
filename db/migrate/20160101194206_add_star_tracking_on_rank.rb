class AddStarTrackingOnRank < ActiveRecord::Migration
  def change
  	add_column :ranks, :joining_star_on, :date
  	add_column :ranks, :heritage_star_on, :date
  	add_column :ranks, :hobbies_star_on, :date
	add_column :ranks, :life_star_on, :date
	add_column :ranks, :outdoor_star_on, :date
	add_column :ranks, :pioneer_star_on, :date
	add_column :ranks, :science_star_on, :date
	add_column :ranks, :values_star_on, :date
  end
end
