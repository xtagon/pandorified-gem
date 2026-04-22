# frozen_string_literal: true

require 'rest_client'
require 'rexml/document'
require 'rexml/xpath'

module Pandorified
  API_URL = 'https://www.pandorabots.com/pandora/talk-xml'

  # The result of sending a message to a bot, including the response message if
  # successful.
  class Result
    def initialize(params)
      @xml = REXML::Document.new(RestClient.post(API_URL, params).to_s)
    end

    # @return [String] The bot's response to the input.
    def that
      @that ||= REXML::XPath.first(@xml, '/result/that').text.strip
    end

    alias to_s that

    # Check the status of this result. See {#success?} and {#error?}.
    #
    # @return [Number] A status number as returned by Pandorabots.
    def status
      @status ||= REXML::XPath.first(@xml, '/result/@status').value.to_i
    end

    # @return `true` if this result was successful (no error was returned by
    #   Pandorabots), `false` otherwise.
    def success?
      status.zero?
    end

    alias ok? success?
    alias successful? success?

    # @note After checking if there is an error, you can read the error message
    #   with {#message}.
    #
    # @return `true` if Pandorabots returned an error.
    def error?
      !success?
    end

    # @return [String] The error message as returned by Pandorabots, if an
    #   error occured.
    def message
      return nil if success?

      @message ||= REXML::XPath.first(@xml, '/result/message').text
    end

    alias error message
    alias error_message message

    # @return [String] The botid of the bot this result is for.
    def botid
      @botid ||= REXML::XPath.first(@xml, '/result/@botid').value
    end

    # @return [String] The custid for this session.
    def custid
      @custid ||= REXML::XPath.first(@xml, '/result/@custid').value
    end

    # @return [String] The orginal input that triggered this response.
    def input
      @input ||= REXML::XPath.first(@xml, '/result/input').text
    end
  end
end
