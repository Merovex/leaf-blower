class Rank < ActiveRecord::Base
  # include PublicActivity::Model
  # tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }

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
  def check_accruals
    self.heritage_on = Date.today if self.heritage_on.nil? and self.heritage > 17
    self.hobbies_on  = Date.today if self.hobbies_on.nil? and self.hobbies > 17
    self.life_on     = Date.today if self.life_on.nil? and self.life_skills > 17
    self.outdoor_on  = Date.today if self.outdoor_on.nil? and self.outdoor_activities > 17
    self.pioneer_on  = Date.today if self.pioneer_on.nil? and self.pioneer_skills > 17
    self.values_on   = Date.today if self.values_on.nil? and self.values > 17
    self.science_on  = Date.today if self.science_on.nil? and self.sci_tech > 17
    self.save!
  end
end
