class EndBreaksController < ApplicationController
  def show
    @finishedbreak = Finishedbreak.find(params[:id])
    authorize @finishedbreak
  end
end
