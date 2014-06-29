class User < ActiveRecord::Base
  module Authorization
    def authorize_url
      self.request_token = request_token_object.token
      self.request_token_secret = request_token_object.secret
      save!

      request_token_object.authorize_url
    end

    def request_token_object
      @request_token_object ||= twitter_oauth_client.request_token oauth_callback: ENV['TWITTER_API_CALLBACK_URL'] + '/authentication/callback'
    end

    def twitter_oauth_client
      # TODO: move these credentials to application.rb
      @twitter_oauth_client ||= TwitterOAuth::Client.new consumer_key: ENV['TWITTER_API_KEY'], consumer_secret: ENV['TWITTER_API_SECRET']
    end

    def authorize! oauth_verifier: nil
      access_token = twitter_oauth_client.authorize request_token, request_token_secret, oauth_verifier: oauth_verifier

      if twitter_oauth_client.authorized?
        self.access_token = access_token.token
        self.access_token_secret = access_token.secret
        save!
      else
        raise 'Boom!'
      end
    end
  end
end
