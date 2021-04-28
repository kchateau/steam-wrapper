require 'faraday'

module Steam
  module Wrapper
    class Client
      def get(url, params = {})
        params_with_key = params.merge({key: ENV["STEAM_API_KEY"]})
        response = Faraday.get(url, params_with_key)
        unless response.success?
          raise RuntimeError("fail")
        end
        JSON.parse(response.body)
      end
    end
  end
end
