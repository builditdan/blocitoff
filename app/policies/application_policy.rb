class ApplicationPolicy
  attr_reader :user, :record, :params

  def initialize(user, record)

    @user = user
    @record = record

  end

  def index?

  true

  end

  def show?
    user_logged_in?
  end

  def create?
    user_logged_in?
  end

  def new?
    user_logged_in?
  end

  def update?
    user_logged_in?
  end

  def destroy?
    user_logged_in?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end

  private

  def user_logged_in?

    if user == nil
      false
    else
      true
    end

  end


end
