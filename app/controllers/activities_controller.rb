class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
  end

  def new
    @preset = Preset.find(params[:presets_id])
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    # Linking the models
    @preset = Preset.find(params[:presets_id])
    @activity.preset = preset.find(params[:presets_id])
    @activity.user = current_user
    authorize @activity
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def destroy
  end

  def activity_params
    params.require(:activity).permit(:)
  end
end
