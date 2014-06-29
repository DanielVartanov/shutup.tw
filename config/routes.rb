Rails.application.routes.draw do
  get 'authentication/authorize_url'
  get 'authentication/callback'

  resource :mute, only: [:new, :create]
end
