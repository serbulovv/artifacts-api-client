# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Monsters
      class << self
        # GET /monsters
        # @param [Hash] params
        def get_all_monsters(params: {})
          Client.get("/monsters", params: params)
        end

        # GET /monsters/{code}
        # @param [String] code
        # @param [Hash] params
        def get_monster(code:, params: {})
          Client.get("/monsters/#{code}", params: params)
        end
      end
    end
  end
end
