# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Characters
      class << self
        # POST /characters/create
        # @param [Hash] params
        def create_character(params: {})
          Client.post("/characters/create", params: params)
        end

        # POST /characters/delete
        # @param [Hash] params
        def delete_character(params: {})
          Client.post("/characters/delete", params: params)
        end

        # GET /characters/{name}
        # @param [String] name
        # @param [Hash] params
        def get_character(name:, params: {})
          Client.get("/characters/#{name}", params: params)
        end
      end
    end
  end
end
