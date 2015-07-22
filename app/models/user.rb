class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  enum role: [:nobody, :folk, :leader, :ranger]
  
  before_create :set_default_role

  # ROLES = %w[ranger leader parent user banned]

  def set_default_role
    self.nobody!
  end

end
