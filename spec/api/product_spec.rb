require 'spec_helper'

describe Ecwid::API::Product, vcr: { cassette_name: 'product', record: :new_episodes } do
  let(:store_id) { ENV['STORE_ID'] }
  let(:token) { ENV['TOKEN'] }
  let(:client) { Ecwid::Client.new(store_id, token) }

  describe '#get_products' do
    it 'returns products' do
      result = client.get_products

      expect(result).to be_kind_of(Hash)
      expect(result['total']).to eq(10)
    end
  end
end