class Attendance < ActiveRecord::Base
  belongs_to :boy
  belongs_to :event
  def name
  	boy.name
  end
  def lastnamefirst
  	boy.name.split(' ').reverse.join(' ').downcase
  end
end
