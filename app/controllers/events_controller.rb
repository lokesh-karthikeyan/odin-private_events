class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def index = (@event = Event.all)

  def new = (@event = current_user.created_events.build)

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to event_path, success: "An event was successfully created!"
    else
      render :new, status: :unprocessable_entity
      flash.now[:error] = "An error occured!"
    end
  end

  private

  def event_params = (params.expect(event: [ :title, :description, :date, :location ]))
end
