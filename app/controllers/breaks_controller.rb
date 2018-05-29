class BreaksController < ApplicationController
  def index
    @breaks = Break.all
  end

  def show
    @break = Break.find(params[:id])
  end

  def new
    @break = Break.new
  end

  def create
    @break = Break.create(break_params)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def break_params
    params.require(:break).permit(:timer_session_id, :activity_id)
  end
end
