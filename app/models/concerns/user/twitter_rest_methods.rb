class User
  module TwitterRestMethods

    extend ActiveSupport::Concern

    def twitter_rest_client
      @twitter_client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_API_KEY'] # TODO use app.configuration
        config.consumer_secret     = ENV['TWITTER_API_SECRET'] # TODO use app.configuration
        config.access_token        = access_token
        config.access_token_secret = access_token_secret
      end
    end

    def mute twitter_name
      twitter_rest_client.mute twitter_name
    end

    def unmute twitter_name
      twitter_rest_client.unmute twitter_name
    end

  end
end
