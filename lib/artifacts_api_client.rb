# frozen_string_literal: true

require 'zeitwerk'
require 'faraday'

module ArtifactsApiClient
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end

loader = Zeitwerk::Loader.for_gem
loader.setup