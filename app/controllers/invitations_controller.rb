class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @event.attendees << current_user
    redirect_to @event, notice: "You've been admitted to this event."
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event.attendees.delete(current_user)
    redirect_to @event, notice: "Event is removed from your schedule."
  end
end
