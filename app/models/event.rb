class Event < ActiveRecord::Base
  attr_accessor :period, :frequency, :commit_button

  belongs_to :location
  scope :before, lambda {|end_time|  {:conditions => ["ends_at < ?", Event.format_date(end_time)] }}
  scope :after, lambda {|start_time| {:conditions => ["starts_at > ?", Event.format_date(start_time)] }}
  
  validates_presence_of :name, :description
  validate :validate_timings
  
  belongs_to :event_series
  
  REPEATS = [
    "Does not repeat",
    "Daily"          ,
    "Weekly"         ,
    "Monthly"        ,
    "Yearly"         
  ]
  
  def validate_timings
    if (starts_at >= ends_at) and !all_day
      errors[:base] << "Start Time must be less than End Time"
    end
  end
  
  def update_events(events, event)
    events.each do |e|
      begin 
        st, et = e.starts_at, e.ends_at
        e.attributes = event
        if event_series.period.downcase == 'monthly' or event_series.period.downcase == 'yearly'
          nst = DateTime.parse("#{e.starts_at.hour}:#{e.starts_at.min}:#{e.starts_at.sec}, #{e.starts_at.day}-#{st.month}-#{st.year}")  
          net = DateTime.parse("#{e.ends_at.hour}:#{e.ends_at.min}:#{e.ends_at.sec}, #{e.ends_at.day}-#{et.month}-#{et.year}")
        else
          nst = DateTime.parse("#{e.starts_at.hour}:#{e.starts_at.min}:#{e.starts_at.sec}, #{st.day}-#{st.month}-#{st.year}")  
          net = DateTime.parse("#{e.ends_at.hour}:#{e.ends_at.min}:#{e.ends_at.sec}, #{et.day}-#{et.month}-#{et.year}")
        end
        #puts "#{nst}           :::::::::          #{net}"
      rescue
        nst = net = nil
      end
      if nst and net
        #          e.attributes = event
        e.starts_at, e.ends_at = nst, net
        e.save
      end
    end
    
    event_series.attributes = event
    event_series.save
  end

  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.title,
      :description => self.description || "",
      :start => starts_at.rfc822,
      :end => ends_at.rfc822,
      :allDay => self.all_day,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.event_path(id)
    }
    
  end
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end
end
