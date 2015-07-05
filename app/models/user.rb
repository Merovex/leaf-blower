class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  # enum role: [:user, :vip, :admin]
  # enum role: [:user, :parent, :leader, :ranger]
  after_initialize :set_default_role, :if => :new_record?

  ROLES = %w[ranger leader parent user banned]

  def set_default_role
    self.role ||= :user
  end
  def role?(r)
  	(self.role.to_sym == r)
  end

end
