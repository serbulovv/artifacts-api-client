# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Maps
      class << self
        # GET /maps
        # @param [Hash] params
        def get_all_maps(params: {})
          Client.get("/maps", params: params)
        end

        # GET /maps/{x}/{y}
        # @param [Integer] x
        # @param [Integer] y
        # @param [Hash] params
        def get_map(x:, y:, params: {})
          Client.get("/maps/#{x}/#{y}", params: params)
        end
      end
    end
  end
end
