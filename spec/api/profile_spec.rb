require 'spec_helper'

describe Ecwid::API::Profile, vcr: { cassette_name: 'profile', record: :new_episodes } do
  let(:store_id) { ENV['STORE_ID'] }
  let(:token) { ENV['TOKEN'] }
  let(:client) { Ecwid::Client.new(store_id, token) }

  describe '#get_profile' do
    it 'returns profile' do
      result = client.get_profile

      expect(result).to be_kind_of(Hash)
      expect(result['generalInfo']['storeId']).to eq(5546116)
    end
  end
end