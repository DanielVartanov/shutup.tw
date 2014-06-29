class UnmuteJob
  include Sidekiq::Worker

  def perform id, twitter_name
    User.find(id).unmute twitter_name
  end
end