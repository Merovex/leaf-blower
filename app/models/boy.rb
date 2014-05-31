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
end
