class ActivitiesController < ApplicationController
  def index
    @preset = Preset.find(params[:preset_id])
    @activities = @preset.activities

    @activity = Activity.new
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
      respond_to do |format|
        format.html { render :new }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  def update
    @activities = Activity.all
    @activity = Activity.new
    @preset = Preset.find(params[:preset_id])
    @activity.update(activity_params)
      respond_to do |format|
        format.html { render :new }
        format.js  # <-- will render `app/views/reviews/update.js.erb`
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
