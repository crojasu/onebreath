class ActivitiesController < ApplicationController
  before_action :set_preset, only: [:index, :new, :create, :edit, :update ]
  before_action :set_activity, only: [:show, :destroy]

  def index
    @activities = @preset.activities
    @activity = Activity.new
    @default_activities = @preset.activities
  end

  def show
  end

  def new
    @activities = @preset.activities
    @activity = Activity.new
  end

  def create
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
    @activity = Activity.new
    @activities = @preset.activities
  end

  def update
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
        format.js
      end
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to preset_path
  end

  private

  def activity_params
    params.require(:activity).permit(:name)
  end

  def set_preset
    @preset = Preset.find(params[:preset_id])
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
