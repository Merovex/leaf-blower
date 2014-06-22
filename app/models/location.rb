class Location < ActiveRecord::Base
	geocoded_by :address
    extend FriendlyId

    friendly_id :name, use: [:slugged, :finders]
	after_validation :geocode, :if => :address_changed?
end
