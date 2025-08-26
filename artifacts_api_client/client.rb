# frozen_string_literal: true

require 'json'

require_relative 'connection'
require_relative 'errors_handler'

module ArtifactsApiClient
  class Client
    class << self
      def get(path, headers: {}, params: {})
        response = connection.get(path, params, default_headers.merge(headers))
        handle_response(response)
      end

      def post(path, headers: {}, params: {})
        response = connection.post(path, params.to_json, default_headers.merge(headers))
        handle_response(response)
      end

      def delete(path, headers: {})
        response = connection.delete(path, nil, default_headers.merge(headers))
        handle_response(response)
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

      def handle_response(response)
        if (200..299).cover?(response.status)
          response.body
        else
          ErrorsHandler.handle_error(response)
        end
      end
    end
  end
end