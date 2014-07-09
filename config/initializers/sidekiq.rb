require 'sidekiq/web'

if ENV["USERNAME"] and ENV["PASSWORD"]
  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    user = ENV["USERNAME"]
    password = ENV["PASSWORD"]
  end
end