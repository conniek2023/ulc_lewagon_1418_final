class EventMembersController < ApplicationController


  def create

    @event_member = current_user.event_members.build
    authorize @event_member
    if @event_member.save
      flash[:notice] = "You have joined an event successfully."
      redirect_to @community_member.community
    else
      flash[:notice] = "Failed"
      redirect_to community_path(@community_member.community)
    end
  end


  def destroy

    @event_member=Event_member.find(params[:id])
    authorize @event_member
    @event_member.destroy
    redirect_to me_path, status: :see_other
  end

end
