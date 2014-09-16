require 'spec_helper'

describe Ecwid::Client, vcr: { cassette_name: 'client', record: :new_episodes } do
  let(:store_id) { ENV['STORE_ID'] }
  let(:token) { ENV['TOKEN'] }
  let(:client) { Ecwid::Client.new(store_id, token) }

  describe '#initialize' do    
    it 'sets store ID correctly' do
      expect(client.store_id).to eq(store_id)
    end

    it 'sets token correctly' do
      expect(client.token).to eq(token)
    end
  end

  describe '#request' do
    it 'uses RestClient' do
      expect(RestClient::Resource).to receive(:new).and_call_original
      client.request(:get, '/orders', {})
    end

    it 'raises error if resource does not exist' do
      expect { client.request(:get, '/blah', {}) }.to raise_error(RestClient::ResourceNotFound)
    end

    [:get, :post, :put, :delete].each do |method|
      it "has a shortcut for #{method} method" do
        path = '/blah'
        expect(client).to receive(:request).with(method, path, {}, {})

        client.send(method, path)
      end
    end
  end
end