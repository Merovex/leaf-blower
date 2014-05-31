class Rank < ActiveRecord::Base
  belongs_to :boy
  def self.find_or_create_by_name(name,boy_id)
      # first_name, last_name = name.split(" ", 2)
      rank = find_or_create_by(name: name, boy_id: boy_id)
	end
	def to_s
		return name
	end
	def leaves(h,b,l,o,p,t,v,s)
			self.heritage = h
			self.hobbies = b
			self.life_skills = l
			self.outdoor_activities = o
			self.pioneer_skills = p
			self.sci_tech = t
			self.values = v
			self.service = s
			self.save
	end
end
