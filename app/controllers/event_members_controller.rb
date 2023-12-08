class EventMembersController < ApplicationController


  def create

    @event_member = current_user.event_members.build(event_id:params[:event_id])
    authorize @event_member
    p @event_member
    if @event_member.save
      flash[:notice] = "You have joined an event successfully."
      redirect_to @event_member.event
    else
      flash[:notice] = "Failed"
      redirect_to event_path(@event_member.event)
    end
  end


  def destroy

    @event_member=Event_member.find(params[:id])
    authorize @event_member
    @event_member.destroy
    redirect_to me_path, status: :see_other
  end

end
