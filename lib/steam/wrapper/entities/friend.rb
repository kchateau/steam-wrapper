module Steam::Wrapper::Entities
  class Friend
    attr_reader :steam_id, :relationship, :friend_since

    def initialize(steam_id:, relationship:, friend_since:)
      @steam_id = steam_id
      @relationship = relationship
      @friend_since = friend_since
    end
  end
end
