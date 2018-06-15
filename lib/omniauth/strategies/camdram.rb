require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    #
    # Authenticate to Camdram via OAuth and retrieve basic user information.
    # Usage:
    #    use OmniAuth::Strategies::Camdram, 'app-id-key', 'app-secret-key', :scope => 'user_shows user_orgs', :display => 'plain'
    #
    class Camdram < OmniAuth::Strategies::OAuth2
      BASE_URL = "https://www.camdram.net"

      option :name, "camdram"

      unless OmniAuth.config.test_mode
        option :client_options, {
          :authorize_url => "#{BASE_URL}/oauth/v2/auth",
          :token_url => "#{BASE_URL}/oauth/v2/token",
          :site => BASE_URL
        }
      else
        option :client_options, {
          :authorize_url => "http://localhost:3000/oauth/v2/auth",
          :token_url => "http://localhost:3000/oauth/v2/token",
          :site => "http://localhost:3000"
        }
      end

      uid do
        raw_info['id']
      end

      info do
        {
          :name => raw_info['name'],
          :email => raw_info['email'],
          :type => raw_info['_type']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/auth/account.json').parsed
      end

    end
  end
end
