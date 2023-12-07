class UsersController < ApplicationController

  def me
    @joined_communities = current_user.joined_communities
    @joined_events = current_user.joined_events
  end

  def update
    if current_user.update(params.require(:user).permit(:first_name, :last_name, :location, :preferred_name, :nationality, :gender))
      redirect_to me_path
    else
      render :update
    end
  end

end
