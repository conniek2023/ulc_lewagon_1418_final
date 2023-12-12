class EventMemberPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user.joined_communities.include?(record.event.community) && user==record.user && record.event.user != user
  end

  def destroy?
    record.user==user || record.event.user==user
  end
end
