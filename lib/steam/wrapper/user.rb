require 'steam/wrapper/client'

module Steam
  module Wrapper
    class User
      def get_friend_list(steam_id)
        client.get("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/", { steamid: steam_id })
      end

      def get_owned_games(steam_id)
        client.get("http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/", { steamid: steam_id })
      end

      def get_player_achievements(steam_id, app_id)
        client.get("http://api.steampowered.com/ISteamUserStats/GetPlayerAchievements/v0001/", { steamid: steam_id, appid: app_id })
      end

      def get_user_stats_for_game(steam_id, app_id)
        client.get("http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/", { steamid: steam_id, appid: app_id })
      end

      private

      def client
        @client ||= Steam::Wrapper::Client.new
      end
    end
  end
end
