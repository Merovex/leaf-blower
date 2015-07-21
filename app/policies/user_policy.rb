class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.ranger?
  end

  def update?
    @user.ranger?
  end

  def destroy?
    @user.ranger?
  end

end
