require 'steam/wrapper/client'

RSpec.describe Steam::Wrapper::Client do
  describe ".get" do
    subject { described_class.new.get(url) }
    let(:url) { 'https://www.google.com' }
    it "returns a parsed response" do
      VCR.use_cassette("client/success") do
        expect(subject).to eq({"foo"=>"bar"})
        expect(subject).to be_a(Hash)
      end
    end
  end
end
