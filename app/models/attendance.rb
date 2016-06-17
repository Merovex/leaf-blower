class Attendance < ActiveRecord::Base
  belongs_to :boy
  belongs_to :rank
  belongs_to :event
  before_save :fix_nil_rank
  def name
  	boy.name
  end
  def lastnamefirst
  	boy.name.split(' ').reverse.join(' ').downcase
  end
  def fix_nil_rank
  	self.rank = boy.current_rank if self.rank.nil?
  end
end