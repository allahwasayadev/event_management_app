class EventPolicy < ApplicationPolicy

  def edit?
    @record.organizer == current_user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
