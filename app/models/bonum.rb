class Bonum < ActiveRecord::Base
  belongs_to :boy
  belongs_to :rank
  belongs_to :reporter, class_name: "User", foreign_key: "reported_by"
  include PublicActivity::Common
  include ActiveModel::Validations
  validates_presence_of :name
end
