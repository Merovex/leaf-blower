class TemplatePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.admin? unless @user.nil?
  end

  def update?
    @user.admin? unless @user.nil?
  end

  def destroy?
    @user.admin? unless @user.nil?
  end

end
