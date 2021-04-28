require 'steam/wrapper/user'

RSpec.describe Steam::Wrapper::User do
  describe ".get_friend_list" do
    subject { described_class.new.get_friend_list(steam_id) }
    let(:steam_id) { '76561198211387647' }
    it "returns a parsed list of steam friends" do
      VCR.use_cassette("user/get_friend_list/success") do
        expect(subject).to have_key("friendslist")
      end
    end
  end

  describe ".get_owned_games" do
    subject { described_class.new.get_owned_games(steam_id) }
    let(:steam_id) { '76561198211387647' }
    it "returns a parsed list of owned games" do
      VCR.use_cassette("user/get_owned_games/success") do
        expect(subject).to have_key("response")
      end
    end
  end

  describe ".get_player_achievements" do
    subject { described_class.new.get_player_achievements(steam_id, app_id) }
    let(:steam_id) { '76561198211387647' }
    let(:app_id) { '440' }
    it "returns a parsed list of player achievements" do
      VCR.use_cassette("user/get_player_achievements/success") do
        expect(subject).to have_key("playerstats")
      end
    end
  end

  describe ".get_user_stats_for_game" do
    subject { described_class.new.get_user_stats_for_game(steam_id, app_id) }
    let(:steam_id) { '76561198211387647' }
    let(:app_id) { '440' }
    it "returns a parsed list of player achievements" do
      VCR.use_cassette("user/get_user_stats_for_game/success") do
        expect(subject).to have_key("playerstats")
      end
    end
  end

  describe ".get_recently_played_games" do
    subject { described_class.new.get_recently_played_games(steam_id) }
    let(:steam_id) { '76561198211387647' }
    it "returns a parsed list of users recently played games" do
      VCR.use_cassette("user/get_recently_played_games/success") do
        expect(subject).to have_key("response")
      end
    end
  end

  describe ".get_player_summaries" do
    subject { described_class.new.get_player_summaries(steamids) }
    let(:steamids) { ['76561198211387647', '76561198017705925'] }
    it "returns a parsed list of player summaries" do
      VCR.use_cassette("user/get_player_summaries/success") do
        expect(subject).to have_key("response")
      end
    end
  end
end
