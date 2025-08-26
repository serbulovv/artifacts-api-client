require 'faraday'

module ArtifactsApiClient
  class Connection
    class << self
      def build
        Faraday.new(ArtifactsApiClient.configuration.base_url) do |f|
          f.request :json
          f.response :json, content_type: 'application/json'
          f.adapter Faraday.default_adapter
        end
      end
    end
  end
end