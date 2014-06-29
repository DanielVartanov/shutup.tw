class MutesController < ApplicationController

  def new
  end

  def create
    current_user = User.last
    current_user.mute params[:twitter_name]
    redirect_to :new_mute, notice: 'Muted!'
  end

end
