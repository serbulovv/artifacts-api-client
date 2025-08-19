require_relative 'artifacts_api_client'

ArtifactsApiClient.configure do |config|
  config.api_key = 'api_key'
end

puts ArtifactsApiClient::Api::Tasks.get_task