# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class NPCS
      class << self
        # GET /npcs/details
        # @param [Hash] params
        def get_all_npcs(params: {})
          Client.get("/npcs/details", params: params)
        end

        # GET /npcs/details/{code}
        # @param [String] code
        # @param [Hash] params
        def get_npc(code:, params: {})
          Client.get("/npcs/details/#{code}", params: params)
        end

        # GET /npcs/items/{code}
        # @param [String] code
        # @param [Hash] params
        def get_npc_items(code:, params: {})
          Client.get("/npcs/items/#{code}", params: params)
        end

        # GET /npcs/items
        # @param [Hash] params
        def get_all_npcs_items(params: {})
          Client.get("/npcs/items", params: params)
        end
      end
    end
  end
end
