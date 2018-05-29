class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
    @preset = Preset.find(params[:preset_id])
  end

  def create
    @activity = Activity.new(activity_params)
    @preset = Preset.find(params[:preset_id])
    @activity.preset_id = @preset
    @activity.save
    if @activity.save
      redirect_to preset_activities(@preset)
    else
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
