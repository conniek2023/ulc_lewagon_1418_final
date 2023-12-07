class UsersController < ApplicationController

  def me
    @joined_communities = current_user.joined_communities
    @joined_events = current_user.joined_events
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:community).permit(:name, :description, :topic))
      redirect_to me_path
    else
      render :edit
    end
  end

end
