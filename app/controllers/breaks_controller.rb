class BreaksController < ApplicationController
  def index
    @breaks = Break.all
  end

  def show
    @break = Break.find(params[:id])
    @artists = RSpotify::Artist.search('shakira')
    @albums = RSpotify::Album.search('shakira')
    @tracks = RSpotify::Track.search('shakira')
    @cancion = @tracks.first.uri

    #if activity = activity.id


  end

  def new
    @break = Break.new
    @timer_session = TimerSession.find(params[:timer_session_id])
    @activities = Activity.all
  end

  def create
    @break = Break.create(break_params)
    @activity = Activity.find(break_params[:activity_id])
    @timer_session = TimerSession.find(params[:timer_session_id])
    @break.timer_session = @timer_session
    @break.activity = @activity
    if @break.save
      redirect_to break_path(@break)
    else
      render :new
    end
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
