class EventsController < ApplicationController

  def new
    authorize @event
    @event=Event.new
    
  end

  def create
    authorize @event
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def destroy
    authorize @event
    @event=Event.find(params[:id])
    @event.destroy
    redirect_to me_path, status: :see_other
  end

  def edit
    authorize @event
    @event = Event.find(params[:id])
    
  
  end

  def update
    authorize @event
    @event = Event.find(params[:id])
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
    params.require(:event).permit(:title, :location, :description, :start_at, :end_at, { :images => []})
  end

end