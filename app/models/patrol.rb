class Patrol < ActiveRecord::Base
  belongs_to :pack
  has_many :boys
end
