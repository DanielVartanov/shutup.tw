class AuthenticationController < ApplicationController
  def authorize_url
    user = User.create!
    redirect_to user.authorize_url
  end

  def callback
    user = User.find_by! request_token: params[:oauth_token]
    user.authorize! oauth_verifier: params[:oauth_verifier]

    session[:user_id] = user.id

    redirect_to root_path
  end
end
