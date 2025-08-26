# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Leaderboard
      class << self
        # GET /leaderboard/characters
        # @param [Hash] params
        def get_characters_leaderboard(params: {})
          Client.get("/leaderboard/characters", params: params)
        end

        # GET /leaderboard/accounts
        # @param [Hash] params
        def get_accounts_leaderboard(params: {})
          Client.get("/leaderboard/accounts", params: params)
        end
      end
    end
  end
end
