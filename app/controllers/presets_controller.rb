class PresetsController < ApplicationController
  def index
    @presets = Preset.all
  end

  def show
    @preset = Preset.find(params[:id])
  end

  def new
    @user = current_user
    @preset = Preset.new
  end

  def create
    @preset = Preset.new(preset_params)
    @preset.user = current_user
    @preset.save

    # Give default activities
    # DefaultActivity.all.each do |def_act|
    #   Activity.create(preset: @preset, default: true, name: def_act.name)
    # end
    if params[:commit] == "Done"
      timer = TimerSession.create(preset_id: @preset.id)
      redirect_to preset_path
    else
      redirect_to new_preset_activity_path(@preset)
    end
  end

  def edit
    @preset = Preset.find(params[:id])
    @user = current_user
  end

  def update
    @preset = Preset.find(params[:id])


    if params[:commit] == "Done"
      @preset.update(preset_params)
      timer = TimerSession.create(preset_id: @preset.id)
      redirect_to presets_path
    elsif params[:commit] == "done editing breaks"

      # Check what activities are unchecked (with value 0)
      # remove them from presets
      params[:preset].each do |activity, value_checked|
        if value_checked == "0"
          act = @preset.activities.find_by(name: activity)
          act.destroy if act
        else
          @preset.activities.find_by(name: activity)#.update(default: false)
        end
      end
      timer = TimerSession.create(preset_id: @preset.id)
      redirect_to timer_session_path(timer)
    else
      @preset.update(preset_params)
      redirect_to  preset_activities_path(@preset)
    end
  end

  def update_activities
    # We update the activities for the given preset
    # that are sent from presets/:preset_id/activites
  end

  def destroy
    @preset = Preset.find(params[:id])
    @preset.destroy
    redirect_to presets_path
  end

   private

  def preset_params
    params.require(:preset).permit(:name, :working_day, :focus_timer, :break_duration)
  end
end
