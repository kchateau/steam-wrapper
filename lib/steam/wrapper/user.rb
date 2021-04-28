require 'steam/wrapper/client'

module Steam
  module Wrapper
    class User
      def get_friend_list(steam_id)
        client.get("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/", { steamid: steam_id })
      end

      private

      def client
        @client ||= Steam::Wrapper::Client.new
      end
    end
  end
end
