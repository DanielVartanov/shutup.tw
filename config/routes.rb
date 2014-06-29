Rails.application.routes.draw do

  resource :mute, only: [:new, :create]

end
