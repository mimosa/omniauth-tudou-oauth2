# -*- encoding: utf-8 -*-
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class TuDou < OmniAuth::Strategies::OAuth2
      option :name, 'tudou'
      option :client_options, {
                 site: "https://api.tudou.com",
        authorize_url: "/oauth2/authorize",
            token_url: "/oauth2/access_token"
      }
      option :token_params, {
        :parse => :json
      }

      uid do
        raw_info['userId']
      end

      info do
        {
             nickname: raw_info['nickName'],
                 name: raw_info['nickName'],
             location: '',
                image: raw_info['userPicUrl'],
          description: '',
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
              access_token.options[:mode] = :query
        access_token.options[:param_name] = 'access_token'
             @uid ||= access_token.post('/oauth2/get_token_info', :parse => :json).parsed['uid']
        @raw_info ||= access_token.get('/v6/user/info', params: signed_params(@uid), :parse => :json).parsed
      end

      ##
      # You can pass +display+, +with_offical_account+ or +state+ params to the auth request, if
      # you need to set them dynamically. You can also set these options
      # in the OmniAuth config :authorize_params option.
      #
      def authorize_params
        super.tap do |params|
          %w[ state ].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]

              # to support omniauth-oauth2's auto csrf protection
              session['omniauth.state'] = params[:state] if v == 'state'
            end
          end
        end
      end

      private
      
      def signed_params(uid)
        {
           format: 'json',
          app_key: client.id,
             user: uid
        }
      end
    end
  end
end

OmniAuth.config.add_camelization "tudou", "TuDou"