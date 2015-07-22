class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  enum role: [:nobody, :folk, :leader, :ranger]
  
  after_initialize :set_default_role, :if => :new_record?

  # ROLES = %w[ranger leader parent user banned]

  def set_default_role
    self.nobody!
  end

end
