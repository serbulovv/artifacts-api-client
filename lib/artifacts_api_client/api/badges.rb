# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Badges
      class << self
        # GET /badges
        # @param [Hash] params
        def get_all_badges(params: {})
          Client.get("/badges", params: params)
        end

        # GET /badges/{code}
        # @param [String] code
        # @param [Hash] params
        def get_badge(code:, params: {})
          Client.get("/badges/#{code}", params: params)
        end
      end
    end
  end
end
