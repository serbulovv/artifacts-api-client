# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Effects
      class << self
        # GET /effects
        # @param [Hash] params
        def get_all_effects(params: {})
          Client.get("/effects", params: params)
        end

        # GET /effects/{code}
        # @param [String] code
        # @param [Hash] params
        def get_effect(code:, params: {})
          Client.get("/effects/#{code}", params: params)
        end
      end
    end
  end
end
