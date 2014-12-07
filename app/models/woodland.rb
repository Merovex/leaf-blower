class Woodland < Boy
  before_save :recalcuate_leaves
  def recalcuate_leaves
    self.set_current_rank if self.current_rank.nil?
  	leaves = {
      :h => 0, 
      :b => 0, 
      :l => 0, 
      :o => 0, 
      :p => 0, 
      :t => 0, 
      :v => 0, 
      :s => 0
    }
    # raise self.bonums.inspect
    [self.events, self.bonums].each do |c|
    	c.each do |event|
    		leaves[:h] += event.heritage || 0
    		leaves[:b] += event.hobbies || 0
    		leaves[:l] += event.life_skills || 0
    		leaves[:o] += event.outdoor_activities || 0
    		leaves[:p] += event.pioneer_skills || 0
    		leaves[:t] += event.sci_tech || 0
    		leaves[:v] += event.values || 0
    		leaves[:s] += event.service || 0
    	end
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