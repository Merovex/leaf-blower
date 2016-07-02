class Boy < ActiveRecord::Base
  include PublicActivity::Common
  
  extend FriendlyId
  validates :name, presence: true
  
  belongs_to :current_rank, class_name: "Rank"
  belongs_to :patrol
  has_many :ranks
  # has_many :bonums, through: :ranks
  
  has_many :attendances
  has_many :events, through: :attendances

  has_many :badges
  has_many :awards
  has_many :achievements

  friendly_id :name, use: [:slugged, :finders]

  accepts_nested_attributes_for :ranks

  after_save :set_current_rank

  def active?
    return (self.active)
  end
  def rank
    self.current_rank
  end
  
  # def correct_rank_start
  #   return if self.current_rank.nil?
  #   c = self.current_rank.created_at
  #   t = DateTime.new(c.strftime("%Y").to_i,7,1)
  #   o = DateTime.new(2014,1,1) 
  #   if c > o and c < t
  #     self.current_rank.created_at = o
  #   else
  #     self.current_rank.created_at = t if c > t
  #   end
  # end
  def current_events
    self.current_rank.events
  end
  def current_bonums
    self.current_rank.bonums
  end
  
  def set_current_rank(g=0)
    if self.current_rank.nil?
      r = self.ranks.create(:name => self.patrol.rank.downcase, :is_current => true)
      self.current_rank = r
      self.save
    elsif (self.current_rank.name != self.patrol.rank.downcase)
      self.current_rank.name = self.patrol.rank.downcase
      self.save
    end
  end
  def lastnamefirst
    n = self.name.split(' ').reverse.join(' ')
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
