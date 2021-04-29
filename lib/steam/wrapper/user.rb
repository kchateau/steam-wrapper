require 'steam/wrapper/client'
require 'steam/wrapper/entities/friend'

module Steam
  module Wrapper
    class User
      def get_friend_list(steam_id)
        response = client.get("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/", { steamid: steam_id })
        response["friendslist"]["friends"].map do |friend|
          Steam::Wrapper::Entities::Friend.new(steam_id: friend["steam_id"], relationship: friend["relationship"], friend_since: friend["friend_since"])
        end
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

      def get_recently_played_games(steam_id)
        client.get("http://api.steampowered.com/IPlayerService/GetRecentlyPlayedGames/v0001/", { steamid: steam_id })
      end

      def get_player_summaries(steamids)
        steam_ids_string = steamids.join(',')
        client.get("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/", { steamids: steam_ids_string})
      end

      private

      def client
        @client ||= Steam::Wrapper::Client.new
      end
    end
  end
end
