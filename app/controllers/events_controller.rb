class EventsController < ApplicationController
  def index
    #checks to see if the user is logged in and is the same user in the url /users/**here**/events
    redirect_if_not_logged_in
    redirect_if_user_doesnt_match(params[:user_id])

    #gets all of the current_user's events
    @events = current_user.events
  end

  def hosted
    #same checks as index action
    redirect_if_not_logged_in
    redirect_if_user_doesnt_match(params[:user_id])

    #gets the events hosted by current_user
    @events = current_user.hosted_events
  end

  def show
    #same checks as index action + checks to make sure the user is attending the event
    redirect_if_not_logged_in
    redirect_if_user_doesnt_match(params[:user_id])
    redirect_if_not_attending

    #gets event for view
    @event = Event.find_by(id: params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def redirect_if_not_attending
      redirect_to "/users/#{session[:user_id]}/events" unless Event.find_by(id: params[:id]).users.inlude?(current_user)
    end
end
