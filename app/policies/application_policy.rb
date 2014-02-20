class ApplicationPolicy
  
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.where(user: user)
    end
  end

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    belongs_to_user?
  end

  def create?
    belongs_to_user
  end

  def new?
    true
  end

  def update?
    belongs_to_user?
  end

  def edit?
    belongs_to_user?
  end

  def destroy?
    belongs_to_user?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  private

    def belongs_to_user?
      @record.user == @user
    end
end
