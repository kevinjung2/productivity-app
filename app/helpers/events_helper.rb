module EventsHelper
  def event_time(event)
    event.time.strftime("%A, %B %e %l:%M%P")
  end
end
