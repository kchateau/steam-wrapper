module Steam::Wrapper::Entities
  class Achievement
    attr_reader :apiname, :achieved, :unlocktime

    def initialize(apiname:, achieved:, unlocktime:)
      @apiname = apiname
      @achieved = achieved
      @unlocktime = unlocktime
    end
  end
end
