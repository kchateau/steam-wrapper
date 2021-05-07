module Steam::Wrapper::Entities
  class Player
    attr_reader :steam_id, :personaname, :profileurl, :avatar, :lastlogoff, :timecreated, :loccountrycode, :locstatecode

    def initialize(steam_id:, personaname:, profileurl:, avatar:, lastlogoff:, timecreated:, loccountrycode:, locstatecode:)
      @steam_id = steam_id
      @personaname = personaname
      @profileurl = profileurl
      @avatar = avatar
      @lastlogoff = lastlogoff
      @timecreated = timecreated
      @loccountrycode = loccountrycode
      @locstatecode = locstatecode
    end
  end
end
