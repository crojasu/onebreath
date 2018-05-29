class TimerSessionsController < ApplicationController
  def index
    @timer_sessions = Timer_session.all
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
end
