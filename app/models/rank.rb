class Rank < ActiveRecord::Base
  belongs_to :boy
  def self.find_or_create_by_name(name,boy_id)
      # first_name, last_name = name.split(" ", 2)
      rank = find_or_create_by(name: name, boy_id: boy_id)
	end
	def to_s
		return name
	end
end
