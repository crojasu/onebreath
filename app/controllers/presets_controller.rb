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
    # if params something
      # redirect_to #timer screen
    # else
      # redirect to new breaks
    # end
  end

  def edit
    @preset = Preset.find(params[:id])
    authorize @preset
    @user = current_user
  end

  def update
    @preset = Preset.find(params[:id])
    @preset.update(preset_params)
    redirect_to preset_path(@preset)
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
