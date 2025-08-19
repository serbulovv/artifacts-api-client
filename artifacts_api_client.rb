# lib/artifacts_client.rb
# frozen_string_literal: true

require_relative 'artifacts_api_client/configuration'
require_relative 'artifacts_api_client/connection'
require_relative 'artifacts_api_client/client'
require_relative 'artifacts_api_client/api/tasks'
require_relative 'artifacts_api_client/api/my_account'

module ArtifactsApiClient
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end