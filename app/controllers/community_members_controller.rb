class CommunityMembersController < ApplicationController

  def create
    authorize @community_member
    @community_member=Community_member.new
  end

end
