# frozen_string_literal: true

require 'pandorified/result'

module Pandorified
  # Raised when Pandorabots returns an API result with a non-zero status.
  class PandorabotsError < StandardError; end

  # Represents a session (or conversation) for interacting with a bot.
  class Session
    # A new session for conversing with a bot.
    #
    # @note If you choose not to specify a {custid}, one will be automatically
    #   chosen and remembered throughout the session.
    #
    # @param [String] botid A valid Pandorabots botid.
    # @param [String] custid An identifier used to keep track of this
    #   conversation.
    def initialize(botid, custid = nil)
      @botid = botid
      @custid = custid
    end

    # Send a message to this session's bot and receive a response.
    #
    # See {Pandorified::Result} for how to check for an error response and get
    # the error message.
    #
    # Alternatively, you can use {#talk!} instead of this method, which raises
    # an exception when Pandorabots API returns an error.
    #
    # @param [String] input Text to say to the bot.
    #
    # @return [Pandorified::Result] The bot's response as a result object.
    def talk(input)
      result = Pandorified::Result.new(
        botid: @botid,
        custid: @custid,
        input: input
      )

      @custid ||= result.custid if result.success?

      result
    end

    # Send a message to this session's bot and receive a response (if
    # successful).
    #
    # If Pandorabots API responds with an error,
    # {Pandorified::PandorabotsError} is raised with the specific error
    # message.
    #
    # If you'd like to check for and handle the error yourself, you can use
    # {#talk} instead of this method.
    #
    # @param [String] input Text to say to the bot.
    #
    # @return [String] The bot's response text.
    def talk!(input)
      result = talk(input)

      if result.error?
        msg = "Pandorabots returned status #{result.status}: #{result.message}"
        raise Pandorified::PandorabotsError, msg
      end

      result.that
    end
  end
end
