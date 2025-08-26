require 'json'

module ArtifactsApiClient
  class ErrorsHandler < StandardError
    attr_reader :status, :body, :error_details

    def initialize(message = nil, status: nil, body: nil, error_code: nil)
      super(message)
      @status = status
      @body = body
      @error_code = error_code
      @error_details = parse_error(body)
    end

    def self.handle_error(response)
      body_parsed = JSON.parse(response.body) rescue response.body
      code = body_parsed.is_a?(Hash) ? body_parsed['code'] : nil

      case response.status
        # General
      when 422 then raise InvalidPayloadError.new("Invalid Payload", status: 422, body: response.body, error_code: code)
      when 429 then raise TooManyRequestsError.new("Too Many Requests", status: 429, body: response.body, error_code: code)
      when 404 then raise NotFoundError.new("Not Found", status: 404, body: response.body, error_code: code)
      when 500 then raise FatalError.new("Fatal Error", status: 500, body: response.body, error_code: code)

      # Email token errors
      when 560 then raise InvalidEmailResetTokenError.new("Invalid Email Reset Token", status: response.status, body: response.body, error_code: code)
      when 561 then raise ExpiredEmailResetTokenError.new("Expired Email Reset Token", status: response.status, body: response.body, error_code: code)
      when 562 then raise UsedEmailResetTokenError.new("Used Email Reset Token", status: response.status, body: response.body, error_code: code)

      # Account errors
      when 451 then raise AccountNotMemberError.new("Account not member", status: response.status, body: response.body, error_code: code)
      when 452 then raise TokenInvalidError.new("Token invalid", status: response.status, body: response.body, error_code: code)
      when 453 then raise TokenExpiredError.new("Token expired", status: response.status, body: response.body, error_code: code)
      when 454 then raise TokenMissingError.new("Token missing", status: response.status, body: response.body, error_code: code)
      when 455 then raise TokenGenerationFailError.new("Token generation failed", status: response.status, body: response.body, error_code: code)
      when 456 then raise UsernameAlreadyUsedError.new("Username already used", status: response.status, body: response.body, error_code: code)
      when 457 then raise EmailAlreadyUsedError.new("Email already used", status: response.status, body: response.body, error_code: code)
      when 458 then raise SamePasswordError.new("Same password", status: response.status, body: response.body, error_code: code)
      when 459 then raise CurrentPasswordInvalidError.new("Current password invalid", status: response.status, body: response.body, error_code: code)
      when 550 then raise AccountSkinNotOwnedError.new("Skin not owned", status: response.status, body: response.body, error_code: code)

      # Character errors
      when 474 then raise CharacterNotThisTaskError.new("Character not this task", status: response.status, body: response.body, error_code: code)
      when 475 then raise CharacterTooManyItemsTaskError.new("Too many items on task", status: response.status, body: response.body, error_code: code)
      when 483 then raise CharacterNotEnoughHpError.new("Not enough HP", status: response.status, body: response.body, error_code: code)
      when 484 then raise CharacterMaximumUtilitiesEquippedError.new("Maximum utilities equipped", status: response.status, body: response.body, error_code: code)
      when 485 then raise CharacterItemAlreadyEquippedError.new("Item already equipped", status: response.status, body: response.body, error_code: code)
      when 486 then raise CharacterLockedError.new("Character locked", status: response.status, body: response.body, error_code: code)
      when 487 then raise CharacterNoTaskError.new("No task", status: response.status, body: response.body, error_code: code)
      when 488 then raise CharacterTaskNotCompletedError.new("Task not completed", status: response.status, body: response.body, error_code: code)
      when 489 then raise CharacterAlreadyTaskError.new("Already task", status: response.status, body: response.body, error_code: code)
      when 490 then raise CharacterAlreadyMapError.new("Already map", status: response.status, body: response.body, error_code: code)
      when 491 then raise CharacterSlotEquipmentError.new("Slot equipment error", status: response.status, body: response.body, error_code: code)
      when 492 then raise CharacterGoldInsufficientError.new("Gold insufficient", status: response.status, body: response.body, error_code: code)
      when 493 then raise CharacterNotSkillLevelRequiredError.new("Skill level not met", status: response.status, body: response.body, error_code: code)
      when 494 then raise CharacterNameAlreadyUsedError.new("Character name already used", status: response.status, body: response.body, error_code: code)
      when 495 then raise MaxCharactersReachedError.new("Max characters reached", status: response.status, body: response.body, error_code: code)
      when 496 then raise CharacterConditionNotMetError.new("Condition not met", status: response.status, body: response.body, error_code: code)
      when 497 then raise CharacterInventoryFullError.new("Inventory full", status: response.status, body: response.body, error_code: code)
      when 498 then raise CharacterNotFoundError.new("Character not found", status: response.status, body: response.body, error_code: code)
      when 499 then raise CharacterInCooldownError.new("Character in cooldown", status: response.status, body: response.body, error_code: code)

      # Item errors
      when 471 then raise ItemInsufficientQuantityError.new("Insufficient quantity", status: response.status, body: response.body, error_code: code)
      when 472 then raise ItemInvalidEquipmentError.new("Invalid equipment", status: response.status, body: response.body, error_code: code)
      when 473 then raise ItemRecyclingInvalidItemError.new("Recycling invalid item", status: response.status, body: response.body, error_code: code)
      when 476 then raise ItemInvalidConsumableError.new("Invalid consumable", status: response.status, body: response.body, error_code: code)
      when 478 then raise MissingItemError.new("Missing item", status: response.status, body: response.body, error_code: code)

      # Grand Exchange errors
      when 431 then raise GeNoOrdersError.new("No orders", status: response.status, body: response.body, error_code: code)
      when 433 then raise GeMaxOrdersError.new("Max orders", status: response.status, body: response.body, error_code: code)
      when 434 then raise GeTooManyItemsError.new("Too many items", status: response.status, body: response.body, error_code: code)
      when 435 then raise GeSameAccountError.new("Same account", status: response.status, body: response.body, error_code: code)
      when 436 then raise GeTransactionInProgressError.new("Transaction in progress", status: response.status, body: response.body, error_code: code)
      when 437 then raise GeInvalidItemError.new("Invalid item", status: response.status, body: response.body, error_code: code)
      when 438 then raise GeNotYourOrderError.new("Not your order", status: response.status, body: response.body, error_code: code)
      when 479 then raise GeMaxQuantityError.new("Max quantity", status: response.status, body: response.body, error_code: code)
      when 480 then raise GeNotInStockError.new("Not in stock", status: response.status, body: response.body, error_code: code)
      when 482 then raise GeNotThePriceError.new("Not the price", status: response.status, body: response.body, error_code: code)

      # Bank errors
      when 460 then raise BankInsufficientGoldError.new("Insufficient gold", status: response.status, body: response.body, error_code: code)
      when 461 then raise BankTransactionInProgressError.new("Transaction in progress", status: response.status, body: response.body, error_code: code)
      when 462 then raise BankFullError.new("Bank full", status: response.status, body: response.body, error_code: code)

      # Maps errors
      when 597 then raise MapNotFoundError.new("Map not found", status: response.status, body: response.body, error_code: code)
      when 598 then raise MapContentNotFoundError.new("Map content not found", status: response.status, body: response.body, error_code: code)

      # NPC errors
      when 441 then raise NpcNotForSaleError.new("NPC not for sale", status: response.status, body: response.body, error_code: code)
      when 442 then raise NpcNotForBuyError.new("NPC not for buy", status: response.status, body: response.body, error_code: code)

      else
        raise self.new("Unexpected error", status: response.status, body: response.body, error_code: code)
      end
    end

    private

    def parse_error(body)
      return body unless body.is_a?(String)

      JSON.parse(body) rescue body
    end

    class InvalidPayloadError < ErrorsHandler; end
    class TooManyRequestsError < ErrorsHandler; end
    class NotFoundError < ErrorsHandler; end
    class FatalError < ErrorsHandler; end
    class InvalidEmailResetTokenError < ErrorsHandler; end
    class ExpiredEmailResetTokenError < ErrorsHandler; end
    class UsedEmailResetTokenError < ErrorsHandler; end
    class AccountNotMemberError < ErrorsHandler; end
    class TokenInvalidError < ErrorsHandler; end
    class TokenExpiredError < ErrorsHandler; end
    class TokenMissingError < ErrorsHandler; end
    class TokenGenerationFailError < ErrorsHandler; end
    class UsernameAlreadyUsedError < ErrorsHandler; end
    class EmailAlreadyUsedError < ErrorsHandler; end
    class SamePasswordError < ErrorsHandler; end
    class CurrentPasswordInvalidError < ErrorsHandler; end
    class AccountSkinNotOwnedError < ErrorsHandler; end
    class CharacterNotThisTaskError < ErrorsHandler; end
    class CharacterTooManyItemsTaskError < ErrorsHandler; end
    class CharacterNotEnoughHpError < ErrorsHandler; end
    class CharacterMaximumUtilitiesEquippedError < ErrorsHandler; end
    class CharacterItemAlreadyEquippedError < ErrorsHandler; end
    class CharacterLockedError < ErrorsHandler; end
    class CharacterNoTaskError < ErrorsHandler; end
    class CharacterTaskNotCompletedError < ErrorsHandler; end
    class CharacterAlreadyTaskError < ErrorsHandler; end
    class CharacterAlreadyMapError < ErrorsHandler; end
    class CharacterSlotEquipmentError < ErrorsHandler; end
    class CharacterGoldInsufficientError < ErrorsHandler; end
    class CharacterNotSkillLevelRequiredError < ErrorsHandler; end
    class CharacterNameAlreadyUsedError < ErrorsHandler; end
    class MaxCharactersReachedError < ErrorsHandler; end
    class CharacterConditionNotMetError < ErrorsHandler; end
    class CharacterInventoryFullError < ErrorsHandler; end
    class CharacterNotFoundError < ErrorsHandler; end
    class CharacterInCooldownError < ErrorsHandler; end
    class ItemInsufficientQuantityError < ErrorsHandler; end
    class ItemInvalidEquipmentError < ErrorsHandler; end
    class ItemRecyclingInvalidItemError < ErrorsHandler; end
    class ItemInvalidConsumableError < ErrorsHandler; end
    class MissingItemError < ErrorsHandler; end
    class GeNoOrdersError < ErrorsHandler; end
    class GeMaxOrdersError < ErrorsHandler; end
    class GeTooManyItemsError < ErrorsHandler; end
    class GeSameAccountError < ErrorsHandler; end
    class GeTransactionInProgressError < ErrorsHandler; end
    class GeInvalidItemError < ErrorsHandler; end
    class GeNotYourOrderError < ErrorsHandler; end
    class GeMaxQuantityError < ErrorsHandler; end
    class GeNotInStockError < ErrorsHandler; end
    class GeNotThePriceError < ErrorsHandler; end
    class BankInsufficientGoldError < ErrorsHandler; end
    class BankTransactionInProgressError < ErrorsHandler; end
    class BankFullError < ErrorsHandler; end
    class MapNotFoundError < ErrorsHandler; end
    class MapContentNotFoundError < ErrorsHandler; end
    class NpcNotForSaleError < ErrorsHandler; end
    class NpcNotForBuyError < ErrorsHandler; end
  end
end