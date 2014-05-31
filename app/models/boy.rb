class Boy < ActiveRecord::Base
  belongs_to :current_rank, class_name: "Rank"
  belongs_to :patrol
  has_many :ranks
end
