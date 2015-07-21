class TemplatePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.ranger? unless @user.nil?
  end

  def update?
    @user.ranger? unless @user.nil?
  end

  def destroy?
    @user.ranger? unless @user.nil?
  end

end
