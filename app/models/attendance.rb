class Attendance < ActiveRecord::Base
  belongs_to :boy
  belongs_to :event
end
