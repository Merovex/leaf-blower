class AddRankIdToAttendances < ActiveRecord::Migration
  def change
  	add_reference :attendances, :rank, polymorphic: false, index: true
  end
end
