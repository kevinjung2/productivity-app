class EventsController < ApplicationController
  def index
    #checks to see if the logged in user is the same user in the url /users/**here**/events
    if current_user != User.find_by(id: params[:user_id])
      redirect_to '/profile', alert: "You can only view your own events"
    else
      @hosted = current_user.hosted_events
      @events = current_user.events.delete_if{ |event| @hosted.include?(event) }
    end
  end
end
