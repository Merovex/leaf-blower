class Boy < ActiveRecord::Base
  extend FriendlyId
  validates :name, presence: true
  
  belongs_to :current_rank, class_name: "Rank"
  belongs_to :patrol
  has_many :ranks
  has_many :bonums
  
  has_many :attendances
  has_many :events, through: :attendances

  has_many :badges
  has_many :awards
  has_many :achievements

  friendly_id :name, use: [:slugged, :finders]

  def correct_rank_start
    c = self.current_rank.created_at
    t = DateTime.new(c.strftime("%Y").to_i,7,1)
    t = DateTime.new(c.strftime("%Y").to_i,1,1) if c.strftime("%Y").to_i == 2014
    self.current_rank.created_at = t if c > t
  end
  def current_events
    puts "Current Events #{correct_rank_start}"
    self.events.where("starts_at > ?", correct_rank_start)
  end
  def current_bonums
    puts "Current Bonums #{correct_rank_start}"
    self.bonums.where("earned_on > ?", correct_rank_start)
  end
  
  def set_current_rank
    r = self.ranks.create(:name => self.patrol.rank.downcase, :is_current => true)
    self.current_rank = r
  	self.save
  end
  def lastnamefirst
    n = self.name.split(' ').reverse.join(' ')
    # raise n.inspect
  end
  def check_badges
    self.set_current_rank if self.current_rank.nil?
    if self.type.nil?
      self.type = "Woodland"
      self.save
    end
    badges = Badge.where(:rank => self.current_rank.name, :active => true)
    
    if self.awards.length != badges.length
      ids = self.awards.map{|a| a.badge_id}
      badges.each {|b| self.awards.create(:badge_id => b.id) unless ids.include?(b.id) }
    end
    self.awards.first.set_achievements unless self.awards.first.nil?
    return self.awards.first
  end
  def rerank(i)
    self.patrol_id = i
    r = self.ranks.create(:name => self.patrol.rank.downcase, :is_current => true)
    self.current_rank = r
  end
  def promote
    self.promoted_at = DateTime.now
    case
      when self.grade == 1
        rerank(2)
      when self.grade == 3
        rerank(3)
      when self.grade == 5
        rerank(4)
    end
    self.grade += 1
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
