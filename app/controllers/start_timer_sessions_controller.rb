class StartTimerSessionsController < ApplicationController
  require 'date'
  def update
    @timer_session = TimerSession.find(params[:id])
    @timer_session.starts_at = Time.now
    @timer_session.save
    respond_to do |format|
      format.html
      format.js #views/start_timer_sessions/update.js.erb
    end
    # retrieve the timer session object with the id in params (url)
    # update the timer session instance (starts_at) with the current datetime
    # save it
    # redirect to the timer session  show
  end
end
