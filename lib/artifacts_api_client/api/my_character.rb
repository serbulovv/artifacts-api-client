# frozen_string_literal: true

module ArtifactsApiClient
  module Api
    class MyCharacter
      class << self
        # POST /my/{name}/action/move
        # @param [String] name
        # @param [Hash] params
        def action_move(name:, params: {})
          Client.post("/my/#{name}/action/move", params: params)
        end

        # POST /my/{name}/action/rest
        # @param [String] name
        # @param [Hash] params
        def action_rest(name:, params: {})
          Client.post("/my/#{name}/action/rest", params: params)
        end

        # POST /my/{name}/action/equip
        # @param [String] name
        # @param [Hash] params
        def action_equip(name:, params: {})
          Client.post("/my/#{name}/action/equip", params: params)
        end

        # POST /my/{name}/action/unequip
        # @param [String] name
        # @param [Hash] params
        def action_unequip(name:, params: {})
          Client.post("/my/#{name}/action/unequip", params: params)
        end

        # POST /my/{name}/action/use
        # @param [String] name
        # @param [Hash] params
        def action_use(name:, params: {})
          Client.post("/my/#{name}/action/use", params: params)
        end

        # POST /my/{name}/action/fight
        # @param [String] name
        # @param [Hash] params
        def action_fight(name:, params: {})
          Client.post("/my/#{name}/action/fight", params: params)
        end

        # POST /my/{name}/action/gathering
        # @param [String] name
        # @param [Hash] params
        def action_gathering(name:, params: {})
          Client.post("/my/#{name}/action/gathering", params: params)
        end

        # POST /my/{name}/action/crafting
        # @param [String] name
        # @param [Hash] params
        def action_crafting(name:, params: {})
          Client.post("/my/#{name}/action/crafting", params: params)
        end

        # POST /my/{name}/action/bank/deposit/gold
        # @param [String] name
        # @param [Hash] params
        def action_deposit_bank_gold(name:, params: {})
          Client.post("/my/#{name}/action/bank/deposit/gold", params: params)
        end

        # POST /my/{name}/action/bank/deposit/item
        # @param [String] name
        # @param [Hash] params
        def action_deposit_bank_item(name:, params: {})
          Client.post("/my/#{name}/action/bank/deposit/item", params: params)
        end

        # POST /my/{name}/action/bank/withdraw/item
        # @param [String] name
        # @param [Hash] params
        def action_withdraw_bank_item(name:, params: {})
          Client.post("/my/#{name}/action/bank/withdraw/item", params: params)
        end

        # POST /my/{name}/action/bank/withdraw/gold
        # @param [String] name
        # @param [Hash] params
        def action_withdraw_bank_gold(name:, params: {})
          Client.post("/my/#{name}/action/bank/withdraw/gold", params: params)
        end

        # POST /my/{name}/action/bank/buy_expansion
        # @param [String] name
        # @param [Hash] params
        def action_buy_bank_expansion(name:, params: {})
          Client.post("/my/#{name}/action/bank/buy_expansion", params: params)
        end

        # POST /my/{name}/action/npc/buy
        # @param [String] name
        # @param [Hash] params
        def action_npc_buy(name:, params: {})
          Client.post("/my/#{name}/action/npc/buy", params: params)
        end

        # POST /my/{name}/action/npc/sell
        # @param [String] name
        # @param [Hash] params
        def action_npc_sell(name:, params: {})
          Client.post("/my/#{name}/action/npc/sell", params: params)
        end

        # POST /my/{name}/action/recycling
        # @param [String] name
        # @param [Hash] params
        def action_recycling(name:, params: {})
          Client.post("/my/#{name}/action/recycling", params: params)
        end

        # POST /my/{name}/action/grandexchange/buy
        # @param [String] name
        # @param [Hash] params
        def action_ge_buy(name:, params: {})
          Client.post("/my/#{name}/action/grandexchange/buy", params: params)
        end

        # POST /my/{name}/action/grandexchange/sell
        # @param [String] name
        # @param [Hash] params
        def action_ge_create_sell_order(name:, params: {})
          Client.post("/my/#{name}/action/grandexchange/sell", params: params)
        end

        # POST /my/{name}/action/grandexchange/cancel
        # @param [String] name
        # @param [Hash] params
        def action_ge_cancel_sell_order(name:, params: {})
          Client.post("/my/#{name}/action/grandexchange/cancel", params: params)
        end

        # POST /my/{name}/action/task/complete
        # @param [String] name
        # @param [Hash] params
        def action_complete_task(name:, params: {})
          Client.post("/my/#{name}/action/task/complete", params: params)
        end

        # POST /my/{name}/action/task/exchange
        # @param [String] name
        # @param [Hash] params
        def action_task_exchange(name:, params: {})
          Client.post("/my/#{name}/action/task/exchange", params: params)
        end

        # POST /my/{name}/action/task/new
        # @param [String] name
        # @param [Hash] params
        def action_accept_new_task(name:, params: {})
          Client.post("/my/#{name}/action/task/new", params: params)
        end

        # POST /my/{name}/action/task/trade
        # @param [String] name
        # @param [Hash] params
        def action_task_trade(name:, params: {})
          Client.post("/my/#{name}/action/task/trade", params: params)
        end

        # POST /my/{name}/action/task/cancel
        # @param [String] name
        # @param [Hash] params
        def action_task_cancel(name:, params: {})
          Client.post("/my/#{name}/action/task/cancel", params: params)
        end

        # POST /my/{name}/action/give/gold
        # @param [String] name
        # @param [Hash] params
        def action_give_gold(name:, params: {})
          Client.post("/my/#{name}/action/give/gold", params: params)
        end

        # POST /my/{name}/action/give/item
        # @param [String] name
        # @param [Hash] params
        def action_give_items(name:, params: {})
          Client.post("/my/#{name}/action/give/item", params: params)
        end

        # POST /my/{name}/action/delete
        # @param [String] name
        # @param [Hash] params
        def action_delete_item(name:, params: {})
          Client.post("/my/#{name}/action/delete", params: params)
        end

        # POST /my/{name}/action/change_skin
        # @param [String] name
        # @param [Hash] params
        def action_change_skin(name:, params: {})
          Client.post("/my/#{name}/action/change_skin", params: params)
        end

        # GET /my/logs
        # @param [Hash] params
        def get_all_characters_logs(params: {})
          Client.get("/my/logs", params: params)
        end

        # GET /my/logs/{name}
        # @param [String] name
        # @param [Hash] params
        def get_character_logs(name:, params: {})
          Client.get("/my/logs/#{name}", params: params)
        end

        # GET /my/characters
        # @param [Hash] params
        def get_my_characters(params: {})
          Client.get("/my/characters", params: params)
        end
      end
    end
  end
end
