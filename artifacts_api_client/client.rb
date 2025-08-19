# frozen_string_literal: true

require 'faraday'
require 'json'

require_relative 'connection'

module ArtifactsApiClient
  class Client
    class << self
      def get(path, headers: {}, params: {})
        connection.get(path, params, default_headers.merge(headers))
        # TODO: Add error parsing
      end

      def post(path, headers: {}, params: {})
        connection.post(path, params.to_json, default_headers.merge(headers)).body
        # TODO: Add error parsing
      end

      def delete(path, headers: {})
        connection.delete(path, nil, default_headers.merge(headers))
        # TODO: Add error parsing
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