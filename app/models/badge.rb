class Badge < ActiveRecord::Base
  extend FriendlyId

  # belongs_to :rank
  friendly_id :name, use: [:slugged, :finders]
  has_many :requirements
end
