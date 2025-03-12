class UsersController < ApplicationController
  def show = (@events = current_user.created_events)
end
