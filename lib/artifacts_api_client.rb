# frozen_string_literal: true

require_relative 'artifacts_api_client/configuration'
require_relative 'artifacts_api_client/connection'
require_relative 'artifacts_api_client/client'
require_relative 'artifacts_api_client/api/tasks'
require_relative 'artifacts_api_client/api/my_account'
require_relative 'artifacts_api_client/api/my_character'
require_relative 'artifacts_api_client/api/achievements'
require_relative 'artifacts_api_client/api/badges'
require_relative 'artifacts_api_client/api/characters'
require_relative 'artifacts_api_client/api/effects'
require_relative 'artifacts_api_client/api/grand_exchange'
require_relative 'artifacts_api_client/api/items'
require_relative 'artifacts_api_client/api/leaderboard'
require_relative 'artifacts_api_client/api/maps'
require_relative 'artifacts_api_client/api/monsters'
require_relative 'artifacts_api_client/api/npcs'
require_relative 'artifacts_api_client/api/resources'
require_relative 'artifacts_api_client/api/token'

# TODO add Zeitwerk

module ArtifactsApiClient
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end