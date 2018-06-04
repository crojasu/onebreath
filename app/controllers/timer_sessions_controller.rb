

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
    @timer_session = TimerSession.find(params[:id])
    @stats = {
      "Workday" => @timer_session.preset.working_day,
      "Focused time" => @timer_session.preset.focus_timer.to_i * @timer_session.breaks.count.to_i
    }
    @timer_session.breaks.each do |b|
      if @stats[b.activity.name].present?
        @stats[b.activity.name] += @timer_session.preset.break_duration
      else
        @stats[b.activity.name] = @timer_session.preset.break_duration
      end
    end
  end


  private

  def timer_session_params
    params.require(:timer_session).permit(:ends_at, :starts_at)
  end
end
