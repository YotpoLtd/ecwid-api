require 'spec_helper'

describe Ecwid::API::Order, vcr: { cassette_name: 'order', record: :new_episodes } do
  let(:store_id) { ENV['STORE_ID'] }
  let(:token) { ENV['TOKEN'] }
  let(:client) { Ecwid::Client.new(store_id, token) }

  describe '#get_orders' do
    it 'returns orders' do
      result = client.get_orders

      expect(result).to be_kind_of(Hash)
      expect(result['total']).to eq(7)
    end
  end
end