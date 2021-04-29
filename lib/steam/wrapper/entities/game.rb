module Steam::Wrapper::Entities
  class Game
    attr_reader :appid, :name, :playtime_forever, :playtime_2weeks, :playtime_windows_forever, :playtime_mac_forever, :playtime_linux_forever

    def initialize(appid:, name:, playtime_forever:, playtime_2weeks:, playtime_windows_forever:, playtime_mac_forever:, playtime_linux_forever:)
      @appid = appid
      @name = name
      @playtime_forever = playtime_forever
      @playtime_2weeks = playtime_2weeks
      @playtime_windows_forever = playtime_windows_forever
      @playtime_mac_forever = playtime_mac_forever
      @playtime_linux_forever = playtime_linux_forever
    end
  end
end
