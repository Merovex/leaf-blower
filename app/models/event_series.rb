class EventSeries < ActiveRecord::Base
	# == Schema Information
# Schema version: 20100330111833
#
# Table name: event_series
#
#  id         :integer(4)      not null, primary key
#  frequency  :integer(4)      default(1)
#  period     :string(255)     default("months")
#  starts_at  :datetime
#  ends_at    :datetime
#  all_day    :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#

class EventSeries < ActiveRecord::Base
  attr_accessor :name, :description, :commit_button
  
  validates_presence_of :frequency, :period, :starts_at, :ends_at
  validates_presence_of :name, :description
  
  has_many :events, :dependent => :destroy

  after_create :create_events_until_end_time
  
  def create_events_until_end_time(end_time=END_TIME)
    st = starts_at
    et = ends_at
    p = r_period(period)
    nst, net = st, et
    
    while frequency.send(p).from_now(st) <= end_time
#      puts "#{nst}           :::::::::          #{net}" if nst and net
      self.events.create(:name => name, :description => description, :all_day => all_day, :starts_at => nst, :ends_at => net)
      nst = st = frequency.send(p).from_now(st)
      net = et = frequency.send(p).from_now(et)
      
      if period.downcase == 'monthly' or period.downcase == 'yearly'
        begin 
          nst = DateTime.parse("#{starts_at.hour}:#{starts_at.min}:#{starts_at.sec}, #{starts_at.day}-#{st.month}-#{st.year}")  
          net = DateTime.parse("#{ends_at.hour}:#{ends_at.min}:#{ends_at.sec}, #{ends_at.day}-#{et.month}-#{et.year}")
        rescue
          nst = net = nil
        end
      end
    end
  end
  
  def r_period(period)
    case period
      when 'Daily'
      p = 'days'
      when "Weekly"
      p = 'weeks'
      when "Monthly"
      p = 'months'
      when "Yearly"
      p = 'years'
    end
    return p
  end
  
end
end
