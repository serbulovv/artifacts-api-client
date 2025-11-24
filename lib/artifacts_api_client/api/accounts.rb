# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Accounts
      class << self
        # POST /accounts/create
        # @param [Hash] params
        def create_account(params: {})
          Client.post("/accounts/create", params: params)
        end

        # POST /accounts/forgot_password
        # @param [Hash] params
        def forgot_password(params: {})
          Client.post("/accounts/forgot_password", params: params)
        end

        # POST /accounts/reset_password
        # @param [Hash] params
        def reset_password(params: {})
          Client.post("/accounts/reset_password", params: params)
        end

        # GET /accounts/{account}/achievements
        # @param [String] account
        # @param [Hash] params
        def get_account_achievements(account:, params: {})
          Client.get("/accounts/#{account}/achievements", params: params)
        end

        # GET /accounts/{account}/characters
        # @param [String] account
        # @param [Hash] params
        def get_account_characters(account:, params: {})
          Client.get("/accounts/#{account}/characters", params: params)
        end

        # GET /accounts/{account}
        # @param [String] account
        # @param [Hash] params
        def get_account(account:, params: {})
          Client.get("/accounts/#{account}", params: params)
        end
      end
    end
  end
end
