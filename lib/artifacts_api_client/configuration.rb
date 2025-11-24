# frozen_string_literal: true

module ArtifactsApiClient
  class Configuration
    BASE_API_URL = 'https://api.artifactsmmo.com/'

    attr_accessor :api_key, :base_url

    def initialize
      @api_key = ENV['ARTIFACTS_API_TOKEN']
      @base_url = BASE_API_URL
    end
  end
end
