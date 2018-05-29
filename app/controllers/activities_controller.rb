class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activities = Activity.all
    @activity = Activity.new
    @preset = Preset.find(params[:preset_id])
  end

  def create
    @activities = Activity.all
    @activity = Activity.new(activity_params)
    @preset = Preset.find(params[:preset_id])
    @activity.preset_id = @preset.id

    if params[:commit] == "done"
      @activity.save
      timer = TimerSession.create(preset_id: @preset.id)
      redirect_to timer_session_path(timer)
    else
      @activity.save
      render :new
    end
  end


  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:name)
  end
end
