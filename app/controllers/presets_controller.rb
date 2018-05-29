class PresetsController < ApplicationController
  def index
    @presets = Preset.all
  end

  def show
  end

  def new
    @user = current_user
    @preset = Preset.new
    #authorize @presets
  end

  def create
    @preset = Preset.new(preset_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

   private

  def preset_params
    params.require(:preset).permit(:working_day, :focus_timer, :break_duration)
  end
end
