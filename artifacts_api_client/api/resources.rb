# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Resources
      class << self
        # GET /resources
        # @param [Hash] params
        def get_all_resources(params: {})
          Client.get("/resources", params: params)
        end

        # GET /resources/{code}
        # @param [String] code
        # @param [Hash] params
        def get_resource(code:, params: {})
          Client.get("/resources/#{code}", params: params)
        end
      end
    end
  end
end
