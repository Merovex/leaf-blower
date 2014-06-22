class Woodland < Boy
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