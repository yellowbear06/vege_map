class EventsController < ApplicationController
  def index
    @events = Event.all
    @new_event = current_user.events.new
  end

  def show
  end
  
  def edit
    @event = current_user.events.find(params[:id])
    render :edit, locals: { event: @event }, formats: :turbo_stream
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path, success: t('.success')
    else
      respond_to do |format|
        format.turbo_stream {render :edit, locals: { event: @event}, status: :unprocessable_entity }
      end
    end
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path, success: t('.success')
    else
      respond_to do |format|
        format.turbo_stream {render :errors, locals: { event: @event}, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  private
  
  def event_params
    params.require(:event).permit(:name, :place_id, :description, :event_url, :start_time, :end_time, :status)
  end
end
