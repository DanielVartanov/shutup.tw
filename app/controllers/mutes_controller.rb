class MutesController < ApplicationController

  def new
  end

  def create
    current_user.mute params[:twitter_name]
    UnmuteJob.perform_in params.require(:mute)[:unmute_at].to_time, current_user.id, params[:twitter_name]
    redirect_to :new_mute, notice: 'Muted!'
  end

end
