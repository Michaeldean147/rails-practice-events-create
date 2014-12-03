class EventsController < ApplicationController
  before_action :set_event, only:[:edit, :update, :destroy]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
      if @event.save
        redirect_to events_path
      else
        render :new
      end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    @event.update(event_params)

    if @event.save
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully destroyed.'
  end

  def set_event
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(
      :date,
      :description,
      :requires_id,
      :capacity,
      :directions
    )

  end

end
