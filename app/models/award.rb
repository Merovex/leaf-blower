class Award < ActiveRecord::Base
  belongs_to :boy
  belongs_to :badge
  belongs_to :requirement
  has_many :achievements

  after_create :set_achievements

  def set_achievements
  	reqs = self.badge.requirements
  	# raise Achievement.new.inspect
    # self.achievements.delete_all # << for testing purposes.
    if self.achievements.length != reqs.length
      ids = self.achievements.map{|a| a.requirement_id}
      reqs.each {|r| self.achievements.create(:requirement_id => r.id) unless ids.include?(r.id) }
    end
  end
end
