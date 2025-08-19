# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class GrandExchange
      class << self
        # GET /grandexchange/history/{code}
        # @param [String] code
        # @param [Hash] params
        def get_ge_sell_history(code:, params: {})
          Client.get("/grandexchange/history/#{code}", params: params)
        end

        # GET /grandexchange/orders
        # @param [Hash] params
        def get_ge_sell_orders(params: {})
          Client.get("/grandexchange/orders", params: params)
        end

        # GET /grandexchange/orders/{id}
        # @param [String] id
        # @param [Hash] params
        def get_ge_sell_order(id:, params: {})
          Client.get("/grandexchange/orders/#{id}", params: params)
        end
      end
    end
  end
end
