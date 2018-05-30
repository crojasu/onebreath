class ActivitiesController < ApplicationController
  def index
    @preset = Preset.find(params[:preset_id])
    @activities = @preset.activities#.where(default: false)
    @activity = Activity.new
    @default_activities = @preset.activities #.where(default: true)
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @preset = Preset.find(params[:preset_id])
    @activities = @preset.activities
    @activity = Activity.new
  end

  def create
    @preset = Preset.find(params[:preset_id])
    @activities = @preset.activities

    @activity = Activity.new(activity_params)
    @activity.preset = @preset
    @activity.chosen = true

    if @activity.save
      redirect_to preset_activities_path(@preset)
    else
      render :new
    end
  end

  def edit
    @preset = Preset.find(params[:preset_id])
    @activity = Activity.new
    @activities = @preset.activities
  end

  def update
    @preset = Preset.find(params[:preset_id])
    @activities = @preset.activities
    @activity = Activity.new
    if params[:commit] == "done"
      @activity.update(activity_params)
      timer = TimerSession.create(preset_id: @preset.id)
      redirect_to preset_path(timer)
    else
      @activity.save
      respond_to do |format|
        format.html { render :new }
        format.js# <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
  end

  private

  def activity_params
    params.require(:activity).permit(:name)
  end
end
