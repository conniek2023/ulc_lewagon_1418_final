class CommunityMembersController < ApplicationController

  def create
    @community_member = current_user.community_members.build
    authorize @community_member
    if @community_member.save
      flash[:notice] = "You have joined a community successfully."
      redirect_to @community_member.community
    else
      flash[:notice] = "Failed"
      redirect_to community_path(@community_member.community)
    end
  end


end
