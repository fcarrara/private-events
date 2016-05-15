class EventAttendeesController < ApplicationController
  before_action :logged_in_user

  def create
    @event = Event.find(params[:event_id])
    current_user.attend_event(@event)
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  def destroy
    @event = EventAttendee.find(params[:id]).event
    current_user.unattend_event(@event)
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end 
  end
end
