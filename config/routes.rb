require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, :at => "/sidekiq"

  get 'authentication/authorize_url'
  get 'authentication/callback'

  resource :mute, only: [:new, :create]
end
