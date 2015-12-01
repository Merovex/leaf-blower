class Woodland < Boy
  before_save :recalcuate_leaves

  def recalcuate_leaves
    return if self.current_rank.nil?
    
    grace = self.current_rank.grace
  	leaves = {
       :h => grace || 0, 
       :b => grace || 0, 
       :l => grace || 0, 
       :o => grace || 0, 
       :p => grace || 0, 
       :t => grace || 0, 
       :v => grace || 0, 
       :s => grace || 0
    }

    [self.current_events, self.current_bonums].each do |c|
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