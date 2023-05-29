class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path
    else
      render :index
    end
  end

  def new
    @event = current_user.events.new
  end

  private
  
  def event_params
    params.require(:event).permit(:name, :place_id, :description, :event_url, :start_time, :end_time, :status)
  end
end
