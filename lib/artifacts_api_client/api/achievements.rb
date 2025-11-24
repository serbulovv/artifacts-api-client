# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Achievements
      class << self
        # GET /achievements
        # @param [Hash] params
        def get_all_achievements(params: {})
          Client.get("/achievements", params: params)
        end

        # GET /achievements/{code}
        # @param [String] code
        # @param [Hash] params
        def get_achievement(code:, params: {})
          Client.get("/achievements/#{code}", params: params)
        end
      end
    end
  end
end
