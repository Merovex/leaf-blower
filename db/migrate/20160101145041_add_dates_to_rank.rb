class AddDatesToRank < ActiveRecord::Migration
  def change
  	add_column :ranks, :joining_on, :date
  	add_column :ranks, :joining_tt_on, :date
  	add_column :ranks, :joining_tt_by, :integer

  	add_column :ranks, :heritage_on, :date
  	add_column :ranks, :heritage_tt_on, :date
  	add_column :ranks, :heritage_tt_by, :integer

  	add_column :ranks, :hobbies_on, :date
	add_column :ranks, :hobbies_tt_on, :date
	add_column :ranks, :hobbies_tt_by, :integer

	add_column :ranks, :life_on, :date
	add_column :ranks, :life_tt_on, :date
	add_column :ranks, :life_tt_by, :integer

	add_column :ranks, :outdoor_on, :date
	add_column :ranks, :outdoor_tt_on, :date
	add_column :ranks, :outdoor_tt_by, :integer

	add_column :ranks, :pioneer_on, :date
	add_column :ranks, :pioneer_tt_on, :date
	add_column :ranks, :pioneer_tt_by, :integer

	add_column :ranks, :science_on, :date
	add_column :ranks, :science_tt_on, :date
	add_column :ranks, :science_tt_by, :integer

	add_column :ranks, :values_on, :date
	add_column :ranks, :values_tt_on, :date
	add_column :ranks, :values_tt_by, :integer

  end
end
