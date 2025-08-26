# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Token
      class << self
        # POST /token
        # @param [Hash] params
        def generate_token(params: {})
          Client.post("/token", params: params)
        end
      end
    end
  end
end
