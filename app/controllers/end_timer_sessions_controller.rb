
class EndTimerSessionsController < ApplicationController
  require 'date'
  def update
    @timer_session = TimerSession.find(params[:id])
    @timer_session.ends_at = Time.now
    @timer_session.save
    # retrieve the timer session object with the id in params (url)
    # update the timer session instance (starts_at) with the current datetime
    # save it
    # redirect to the timer session  show
  end
end
