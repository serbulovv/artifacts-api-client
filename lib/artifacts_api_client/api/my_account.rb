# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class MyAccount
      class << self
        # GET /my/bank
        # @param [Hash] params
        def get_bank_details(params: {})
          Client.get('/my/bank', params: params)
        end

        # GET /my/bank/items
        # @param [Hash] params
        def get_bank_item(params: {})
          Client.get('/my/bank/items', params: params)
        end

        # GET /my/grandexchange/orders
        # @param [Hash] params
        def get_ge_sell_orders(params: {})
          Client.get('/my/grandexchange/orders', params: params)
        end

        # GET /my/grandexchange/history
        # @param [Hash] params
        def get_ge_sell_history(params: {})
          Client.get('/my/grandexchange/history', params: params)
        end

        # GET /my/details
        # @param [Hash] params
        def get_account_details(params: {})
          Client.get('/my/details', params: params)
        end

        # GET /my/change_password
        # @param [Hash] params
        def change_password(params: {})
          Client.post("/my/change_password", params: params)
        end
      end
    end
  end
end
