class EventsController < ApplicationController

  def new
    @community = Community.find(params[:community_id])
    @event=Event.new
    authorize @event

  end

  def create
    # @event = current_user.events.build(community_id:params[:community_id])
    @community = Community.find(params[:community_id])
    @event = Event.new(event_params)
    @event.community = @community
    @event.user = current_user
    authorize @event
    # @event.save

    if @event.save
      redirect_to community_path(@community)
    else
      render :new
    end
  end

  def destroy

    @event=Event.find(params[:id])
    @community=@event.community
    authorize @event
    @event.destroy
    redirect_to community_path(@community), status: :see_other
  end

  def edit

    @event = Event.find(params[:id])
    authorize @event

  end

  def update

    @event = Event.find(params[:id])
    authorize @event
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end


  end

  def show

    @event = Event.find(params[:id])
    authorize @event
  end

  private

  def event_params
    # params.require(:event).permit(:title, :location, :description, :type,:start_at, :end_at, { :images => []})
    params.require(:event).permit(:title, :location, :type, :introduction)
  end

end
