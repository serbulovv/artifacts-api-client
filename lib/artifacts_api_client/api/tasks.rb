# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class Tasks
      class << self
        # GET /tasks/list
        # @param [Hash] params
        def get_all_tasks(params: {})
          Client.get('/tasks/list', params: params)
        end

        # GET /tasks/list/code
        # @param [String] task_code
        # @param [Hash] params
        def get_task(task_code:, params: {})

          Client.get("/tasks/list/#{task_code}", params: params)
        end

        # GET /tasks/rewards
        # @param [Hash] params
        def get_all_tasks_rewards(params: {})
          Client.get('/tasks/rewards', params: params)
        end

        # GET /tasks/rewards/{code}
        # @param [String] task_code
        # @param [Hash] params
        def get_tasks_reward(task_code:, params: {})
          Client.get("/tasks/rewards/#{task_code}", params: params)
        end
      end
    end
  end
end
