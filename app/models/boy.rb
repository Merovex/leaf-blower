class Boy < ActiveRecord::Base
  belongs_to :current_rank, class_name: "Rank"
  belongs_to :patrol
  has_many :ranks
  has_many :attendances
  has_many :events, through: :attendances
  def set_current_rank
  	self.current_rank = Rank.find_or_create_by_name(patrol.rank.downcase, self.id)
  	self.save
  end
  def recalcuate_leaves
  	leaves = {:h => 0, :b => 0, :l => 0, :o => 0, :p => 0, :t => 0, :v => 0, :s => 0}
  	self.events.each do |event|
		leaves[:h] += event.heritage || 0
		leaves[:b] += event.hobbies || 0
		leaves[:l] += event.life_skills || 0
		leaves[:o] += event.outdoor_activities || 0
		leaves[:p] += event.pioneer_skills || 0
		leaves[:t] += event.sci_tech || 0
		leaves[:v] += event.values || 0
		leaves[:s] += event.service || 0
  	end
  	self.current_rank.leaves(
  		leaves[:h],
		leaves[:b],
		leaves[:l],
		leaves[:o],
		leaves[:p],
		leaves[:t],
		leaves[:v],
		leaves[:s],
  	)
  end
end
