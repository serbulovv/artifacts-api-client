# frozen_string_literal: true

require 'faraday'
require 'json'

require_relative 'connection'

module ArtifactsApiClient
  class Client
    class << self
      def get(path, headers: {}, params: {})
        connection.get(path, params, default_headers.merge(headers)).body
      end

      def post(path, body: nil, headers: {})
        connection.post(path, body&.to_json, default_headers.merge(headers)).body
      end

      def delete(path, headers: {})
        connection.delete(path, nil, default_headers.merge(headers)).body
      end

      private

      def connection
        @connection ||= Connection.build
      end

      def default_headers
        {
          'Authorization' => "Bearer #{ArtifactsApiClient.configuration.api_key}",
          'Accept'        => 'application/json',
          'Content-Type'  => 'application/json'
        }
      end
    end
  end
end