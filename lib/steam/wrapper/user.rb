require 'steam/wrapper/client'
require 'steam/wrapper/entities/friend'
require 'steam/wrapper/entities/game'
require 'steam/wrapper/entities/player'

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
        response = client.get("http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/", { steamid: steam_id, include_appinfo: true })
        response["response"]["games"].map do |game|
          Steam::Wrapper::Entities::Game.new(
            appid: game["appid"],
            name: game["name"],
            playtime_forever: game["playtime_forever"],
            playtime_2weeks: "",
            playtime_windows_forever: game["playtime_windows_forever"],
            playtime_mac_forever: game["playtime_mac_forever"],
            playtime_linux_forever: game["playtime_linux_forever"]
        ) end
      end

      def get_player_achievements(steam_id, app_id)
        client.get("http://api.steampowered.com/ISteamUserStats/GetPlayerAchievements/v0001/", { steamid: steam_id, appid: app_id })
      end

      def get_user_stats_for_game(steam_id, app_id)
        client.get("http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/", { steamid: steam_id, appid: app_id })
      end

      # Currently fails if the user doesnt have any recently played games
      def get_recently_played_games(steam_id)
        response = client.get("http://api.steampowered.com/IPlayerService/GetRecentlyPlayedGames/v0001/", { steamid: steam_id })
        response["response"]["games"].map do |game|
          Steam::Wrapper::Entities::Game.new(
            appid: game["appid"],
            name: game["name"],
            playtime_forever: game["playtime_forever"],
            playtime_2weeks: game["playtime_2weeks"],
            playtime_windows_forever: game["playtime_windows_forever"],
            playtime_mac_forever: game["playtime_mac_forever"],
            playtime_linux_forever: game["playtime_linux_forever"]
        ) end
      end

      def get_player_summaries(steamids)
        steam_ids_string = steamids.join(',')
        response = client.get("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/", { steamids: steam_ids_string})
        response["response"]["players"].map do |player|
          Steam::Wrapper::Entities::Player.new(
            steam_id: player["steam_id"],
            personaname: player["personaname"],
            profileurl: player["profileurl"],
            avatar: player["avatar"],
            lastlogoff: player["lastlogoff"],
            timecreated: player["timecreated"],
            loccountrycode: player["loccountrycode"],
            locstatecode: player["locstatecode"],
          ) end
      end

      private

      def client
        @client ||= Steam::Wrapper::Client.new
      end
    end
  end
end
