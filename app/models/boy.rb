class Boy < ActiveRecord::Base
  extend FriendlyId
  validates :name, presence: true
  
  belongs_to :current_rank, class_name: "Rank"
  belongs_to :patrol
  has_many :ranks
  
  has_many :attendances
  has_many :events, through: :attendances

  has_many :badges
  has_many :awards
  has_many :achievements

  friendly_id :name, use: [:slugged, :finders]
  def set_current_rank
  	self.current_rank = Rank.find_or_create_by_name(patrol.rank.downcase, self.id)
  	self.save
  end

  def check_badges
    badges = Badge.where(:rank => self.current_rank.name, :active => true)
    
    if self.awards.length != badges.length
      ids = self.awards.map{|a| a.badge_id}
      badges.each {|b| self.awards.create(:badge_id => b.id) unless ids.include?(b.id) }
    end
    # self.awards.each {|a| a.check_achievements }
    self.awards.first.set_achievements unless self.awards.first.nil?
    return self.awards.first
  end
  def promote
    case 
      when type == 'Woodland'
        n = 'Navigator'
      when type == 'Navigator'
        n = 'Adventurer'
      else
        n = 'Adventurer'
    end
    type = n
    save!
  end
  def demote
    case 
      when type == 'Adventurer'
        n = 'Navigator'
      when type == 'Navigator'
        n = 'Woodland'
      else
        n = 'Woodland'
    end
    type = n
    save!
  end
end
