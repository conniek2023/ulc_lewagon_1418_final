class CommunityMembersController < ApplicationController

  def create
    # @community_member = current_user.community_members.build(community_id: params[:community_id])
    @community_member = CommunityMember.new(community_id: params[:community_id], user_id: current_user.id)
    authorize @community_member
    if @community_member.save
      flash[:alert] = "You have joined a community successfully."
      redirect_to community_path(@community_member.community)
    else
      flash[:alert] = "Failed"
      redirect_to community_path(@community_member.community)
    end
  end


end
