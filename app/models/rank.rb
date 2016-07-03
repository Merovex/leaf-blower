class Rank < ActiveRecord::Base
  before_save :before_save_adjustments
  # include PublicActivity::Model
  # tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }
  TARGET = 9
  STAR_TARGET = 18
  BRANCHES = {
    'heritage' => "heritage",
    'hobbies' => "hobbies",
    'life_skills' => "life",
    'outdoor_activities' => "outdoor",
    'pioneer_skills' => "pioneer",
    'sci_tech' => "science",
    'values' => "values",
    'forest' => 'forest',
  }

  belongs_to :boy
  has_many :attendances
  has_many :bonums
  has_many :events, through: :attendances

  def fix_attendances!
    bad = self.attendances.map { |a| a if a.event.starts_at < self.created_at }.compact
    last_rank = boy.ranks.where(["created_at < ?",  self.created_at]).last
    bad.each do |b|
      b.rank = last_rank
      b.save
    end
  end
  def self.find_or_create_by_name(name,boy_id)
    # first_name, last_name = name.split(" ", 2)
    rank = find_or_create_by(name: name, boy_id: boy_id)
  end
  def to_s
    return name
  end
  def forest
    return BRANCHES.keys.map { |b| branch_accrued?(b) ? 1 : 0 unless b == 'forest' }.compact.sum
  end
  def branch_to_track(k)
    BRANCHES[k]
  end
  def leaves(branch)
    self.public_send(branch.to_sym)
  end
  def branch_accrued?(b)
    accured_on = self.public_send("#{branch_to_track(b)}_on".to_sym)
    return (leaves(b) >= TARGET and (!accured_on.blank? or !accured_on.nil?))
  end
  def branch_awarded?(b)
      ttd_on = self.public_send("#{branch_to_track(b)}_tt_on".to_sym)
      awarded = !(ttd_on.blank? or ttd_on.nil?)
  end
  def branch_not_star?(b)
    branch_accrued?(b) and !is_star?(b)
  end
  def forest_awarded?
    return branch_awarded?('forest')
  end
  def forest_accrued?
    return (forest == 7)
  end
  def is_star?(branch)
    eligible = (self.public_send(branch.to_sym) > STAR_TARGET)
    return (forest_awarded? and eligible)
  end
  def before_save_adjustments
    fix_create_at
    fix_attendances!
    recalcuate_leaves
    check_accruals
  end
  def recalcuate_leaves
    l = {
       :heritage => 0, 
       :hobbies => 0, 
       :life_skills => 0, 
       :outdoor_activities => 0, 
       :pioneer_skills => 0, 
       :sci_tech => 0, 
       :values => 0, 
       :service => 0
    }

    [events, bonums].each do |c|
      c.each do |event|
        l[:heritage] += event.heritage || 0
        l[:hobbies] += event.hobbies || 0
        l[:life_skills] += event.life_skills || 0
        l[:outdoor_activities] += event.outdoor_activities || 0
        l[:pioneer_skills] += event.pioneer_skills || 0
        l[:sci_tech] += event.sci_tech || 0
        l[:values] += event.values || 0
        l[:service] += event.service || 0
      end
    end
    self.attributes = l
  end
  def check_forest
    on = self.forest_on
    by = self.forest_tt_by
    if (forest_accrued? and on.nil? and by.nil?)
        self.forest_on = Date.today
        self.save
    end
  end
  def check_accruals
    [[TARGET,'branch'], [STAR_TARGET,'star'] ].each do |test|
      BRANCHES.invert.each do |b|
        next if b[0] == 'forest'
        on     = self.public_send("#{b[0]}_on".to_sym)
        leaves = self.public_send("#{b[1]}".to_sym)
        t      = self.public_send("#{b[0]}_type".to_sym) 
        # puts [on, leaves, t,(test[1] == 'star' and t != 'star' and leaves > test[0])].inspect
        # puts [test[1], t , leaves, test[0], leaves > test[0]].inspect if test[1] == 'star'
        if (test[1] == 'branch' and leaves < test[0])
          self.public_send("#{b[0]}_on=".to_sym,nil)
          self.public_send("#{b[0]}_tt_on=".to_sym,nil)
          self.public_send("#{b[0]}_tt_by=".to_sym,nil)
        elsif (test[1] == 'star' and t != 'star' and leaves > test[0])
          self.public_send("#{b[0]}_on=".to_sym,Date.today)
          self.public_send("#{b[0]}_tt_on=".to_sym,"")
          self.public_send("#{b[0]}_tt_by=".to_sym,nil)
          self.public_send("#{b[0]}_type=".to_sym,test[1]) unless b[0] == 'forest'
          self.save!
        elsif (on.nil? and leaves >= test[0])
          self.public_send("#{b[0]}_on=".to_sym,Date.today)
          self.public_send("#{b[0]}_type=".to_sym,test[1]) unless b[0] == 'forest'
          self.save!
        end
      end
    end
    check_forest
  end
  def fix_create_at
    c = self.created_at
    t = DateTime.new(c.strftime("%Y").to_i,7,1)
    self.created_at = t if c < t
  end
end
