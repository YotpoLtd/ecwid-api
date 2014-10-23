require 'oj'
require 'rest-client'

require 'ecwid/api/profile'
require 'ecwid/api/order'
require 'ecwid/api/product'

module Ecwid
  class Client
    include Ecwid::API::Profile
    include Ecwid::API::Order
    include Ecwid::API::Product

    def initialize(store_id, token)
      @configuration = {
        store_id: store_id,
        token: token
      }
    end

    def store_id
      @configuration[:store_id]
    end

    def token
      @configuration[:token]
    end

    def get(path, options = {}, headers = {})
      request(:get, path, options, headers)
    end

    def post(path, options = {}, headers = {})
      request(:post, path, options, headers)
    end

    def put(path, options = {}, headers = {})
      request(:put, path, options, headers)
    end

    def delete(path, options = {}, headers = {})
      request(:delete, path, options, headers)
    end

    def request(method, path, options, headers = {})
      client = RestClient::Resource.new("https://app.ecwid.com/api/v3/#{@configuration[:store_id]}#{path}")
      options.merge!(token: @configuration[:token])
      
      begin
        response = case method
                   when :get then
                     client.get(headers.merge({ params: options, content_type: :json }))
                   when :post then
                     client.post(options, headers.merge({ content_type: :json }))
                   when :put then
                     client.put(options, headers.merge({ content_type: :json }))
                   when :delete then
                     client.delete
                   end
        
        Oj.load response if((200..201) === response.code)
      rescue RestClient::NotModified
        nil
      rescue RestClient::Forbidden => e
        raise Ecwid::HTTPUnauthorized.new 'Invalid Ecwid credentials'      
      end
    end
  end

  class HTTPUnauthorized < Exception; end
end