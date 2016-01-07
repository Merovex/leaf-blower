class Patrol < ActiveRecord::Base
  belongs_to :pack
  has_many :boys
  validates_presence_of :name
  validates_presence_of :rank
end
