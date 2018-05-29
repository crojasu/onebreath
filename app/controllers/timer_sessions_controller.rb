class TimerSessionsController < ApplicationController
  def index
  end

  def show
    @timer_session = Timer_session.find(params[:id])
  end

  def new
    @timer_session = Timer_session.new
  end

  def create
    @timer_session = Timer_session.create(timer_session_params)
    if timer_session.save
      redirect_to timer_session_path(@timer_session)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def timer_session_params
    params.require(:timer_session).permit(:ends_at, :starts_at)
  end
end
