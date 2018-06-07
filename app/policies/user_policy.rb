class UserPolicy < ApplicationPolicy
  def index?
  	user.Admin?
  end
  def edit?
    user.Admin?
  end
  def update?
    user.Admin?
  end
  def admin?
    user.Admin?
  end
  def destroy?
  	user.Admin?
  end
  def solicitante?
    user.Solicitante?
  end
  def responsable?
    user.Responsable?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
  
end
