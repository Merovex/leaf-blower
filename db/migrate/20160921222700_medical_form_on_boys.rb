class MedicalFormOnBoys < ActiveRecord::Migration
  def change
  	add_column :boys, :medical_on, :date
  end
end
