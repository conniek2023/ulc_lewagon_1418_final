class EventsController < ApplicationController

  def create
    authorize @event
  end

  def destroy
    authorize @event
  end

  def new
    authorize @event
  end

  def edit
    authorize @event
  end

  def update
    authorize @event
  end

  def show
    authorize @event
  end


end
