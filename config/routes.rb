Rails.application.routes.draw do
  get 'authentication/authorize_url'
  get 'authentication/callback'
  root 'pages/home'

  resource :mute, only: [:new, :create]
end
