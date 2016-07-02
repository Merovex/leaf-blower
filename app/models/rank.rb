class Rank < ActiveRecord::Base
  # include PublicActivity::Model
  # tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }

  belongs_to :boy
  has_many :attendances
  has_many :bonums
  has_many :events, through: :attendances

  def self.find_or_create_by_name(name,boy_id)
    # first_name, last_name = name.split(" ", 2)
    rank = find_or_create_by(name: name, boy_id: boy_id)
  end
  def to_s
    return name
  end
  def accrued?(b)

  end
  def awarded?(a)
  end
  def starable?
    starry = 0
    branches = [
      'heritage',
      'life_skills',
      'hobbies',
      'outdoor_activities',
      'pioneer_skills',
      'values',
      'sci_tech'
    ]
    branches.each do |s|
      starry += 1 if self.public_send(s) > 9
    end
    puts score
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
  # def events 
  #   self.current_rank
  # end
  def check_accruals
    branches = [
      ['heritage','heritage'],
      ['life','life_skills'],
      ['hobbies','hobbies'],
      ['outdoor','outdoor_activities'],
      ['pioneer','pioneer_skills'],
      ['values','values'],
      ['science','sci_tech']
    ]

    [[9,'branch'], [18,'star'] ].each do |test|
      branches.each do |b|
        on = self.public_send("#{b[0]}_on".to_sym)
        leaves = self.public_send("#{b[1]}".to_sym)
        t = self.public_send("#{b[0]}_type".to_sym)
        # puts [on, leaves, t,(test[1] == 'star' and t != 'star' and leaves > test[0])].inspect
        puts [test[1], t , leaves, test[0], leaves > test[0]].inspect if test[1] == 'star'
        if (test[1] == 'star' and t != 'star' and leaves > test[0])
          self.public_send("#{b[0]}_on=".to_sym,Date.today)
          self.public_send("#{b[0]}_tt_on=".to_sym,"")
          self.public_send("#{b[0]}_tt_by=".to_sym,nil)
          self.public_send("#{b[0]}_type=".to_sym,test[1])
          self.save!
        elsif (on.nil? and leaves > test[0])
          self.public_send("#{b[0]}_on=".to_sym,Date.today)
          self.public_send("#{b[0]}_type=".to_sym,test[1])
          self.save!
        end
      end
    end
  end
end
