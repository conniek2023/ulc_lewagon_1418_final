class UsersController < ApplicationController

  def me
    @joined_communities = current_user.joined_communities
    @joined_events = current_user.joined_events
  end

  def update
    @user = Community.find(params[:id])
    if @community.update(community_params)
      redirect_to @community
    else
      render :edit
    end
  end

end
