class TimerSessionsController < ApplicationController
  def index

  end

  def show
    @timer_session = TimerSession.find(params[:id])
  end

  def new
    @timer_session = TimerSession.new
  end

  def create
    @timer_session = TimerSession.new
    @timer_session.preset = Preset.find(params[:preset_id])
    if @timer_session.save
      redirect_to timer_session_path(@timer_session)
    else
      render :new
    end
  end

  def destroy
  end

  def stats
    @stat = TimerSession.find(params[:id])
  end


  private

  def timer_session_params
    params.require(:timer_session).permit(:ends_at, :starts_at)
  end
end
