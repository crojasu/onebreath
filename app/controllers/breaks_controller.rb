require 'date'

class BreaksController < ApplicationController
  def index
    @breaks = Break.all
  end

  def show
    @break = Break.find(params[:id])

  end

  def new
    @break = Break.new
    @timer_session = TimerSession.find(params[:timer_session_id])
    @activities = Activity.all
  end

  def create
    @break = Break.new(break_params)
    @timer_session = TimerSession.find(params[:timer_session_id])
    @activity = Activity.find(break_params[:activity_id])
    @break.timer_session = @timer_session
    @break.activity = @activity
    @break.length = @timer_session.preset.break_duration
    if @break.save
      redirect_to break_path(@break)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @break = Break.find(params[:id])
    @timer_session = @break.timer_session
    @timer_session.starts_at = Time.now
    @timer_session.save
    respond_to do |format|
      format.html
      format.js #views/start_timer_sessions/update.js.erb
    end
  end

  def destroy

  end

  private

  def break_params
    params.require(:break).permit(:timer_session_id, :activity_id, :length)
  end
end
