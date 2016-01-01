class Bonum < ActiveRecord::Base
  belongs_to :boy
  belongs_to :rank
  include PublicActivity::Common
  include ActiveModel::Validations
  validates_presence_of :name, :reported_by, :earned_on
end
