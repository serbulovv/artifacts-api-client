# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Items
      class << self
        # GET /items
        # @param [Hash] params
        def get_all_items(params: {})
          Client.get("/items", params: params)
        end

        # GET /items/{code}
        # @param [String] code
        # @param [Hash] params
        def get_item(code:, params: {})
          Client.get("/items/#{code}", params: params)
        end
      end
    end
  end
end
