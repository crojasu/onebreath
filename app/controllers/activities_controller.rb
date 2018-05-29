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
    @activity = Activity.create(activity_params)
  end

  def destroy

  end

  private

  def activity_params
    params.require(:activity).permit(:name, :preset_id)
  end
end
