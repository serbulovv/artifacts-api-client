# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Events
      class << self
        # GET /events/active
        # @param [Hash] params
        def get_all_active_events(params: {})
          Client.get("/events/active", params: params)
        end

        # GET /events
        # @param [Hash] params
        def get_all_events(params: {})
          Client.get("/events", params: params)
        end
      end
    end
  end
end
