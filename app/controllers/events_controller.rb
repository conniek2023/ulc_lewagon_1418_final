class EventsController < ApplicationController

  def new
    @event=Event.new
    authorize @event
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
    authorize @event
  end

  def destroy
    @event=Event.find(params[:id])
    @event.destroy
    redirect_to me_path, status: :see_other
    authorize @event
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
    authorize @event
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  private

  def event_params
    authorize @event
    params.require(:event).permit(:title, :location, :description, :start_at, :end_at, { :images => []})
  end

end