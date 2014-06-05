class Attendance < ActiveRecord::Base
  belongs_to :boy
  belongs_to :event
  def name
  	boy.name
  end
end
