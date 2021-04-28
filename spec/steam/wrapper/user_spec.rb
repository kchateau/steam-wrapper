require 'steam/wrapper/user'

RSpec.describe Steam::Wrapper::User do
  describe ".get_friend_list" do
    subject { described_class.new.get_friend_list(steam_id) }
    let(:steam_id) { '76561198211387647' }
    it "returns a parsed list of steam friends" do
      VCR.use_cassette("user/success") do
        expect(subject).to have_key("friendslist")
      end
    end
  end
end
