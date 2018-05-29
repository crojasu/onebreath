class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @preset = Preset.find(params[:presets_id])
    @activity.preset = @preset
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def destroy

  end

  private

  def activity_params
    params.require(:activity).permit(:name, :preset_id)
  end
end
