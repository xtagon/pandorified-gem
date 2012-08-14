require 'pandorified/result'

module Pandorified
	# Raised when Pandorabots returns an API result with a non-zero status.
	class PandorabotsError < StandardError; end

	class Session
		# A new session for conversing with a bot.
		#
		# @note If you choose not to specify a {custid}, one will be chosen automatically and remembered throughout the session.
		#
		# @param [String] botid A valid Pandorabots botid.
		# @param [String] custid An identifier used to keep track of this conversation.
		def initialize(botid, custid = nil)
			@botid = botid
			@custid = custid
		end

		# Send a message to this session's bot and receive a response.
		#
		# @note See {Pandorified::Result} for ways to handle the response, or use {#talk!} which raises an exception on errors.
		#
		# @param [String] input Text to say to the bot.
		#
		# @return [String] The bot's response text.
		def talk(input)
			result = Pandorified::Result.new(botid: @botid, custid: @custid, input: input)
			@custid ||= result.custid if result.success?
			result
		end

		# Send a message to this session's bot and receive a response (if successful).
		# If Pandorabots responds with an error, {Pandorified::Exceptions::PandorabotsError} is raised.
		#
		# @note See {#talk} if you want to check the {Pandorabots::Result} object for success instead of an exception being raised on error.
		#
		# @param [String] input Text to say to the bot.
		#
		# @return [String] The bot's response text.
		def talk!(input)
			result = self.talk(input)
			raise Pandorified::PandorabotsError, "Pandorabots returned status #{result.status}: #{result.message}" if result.error?
		end
	end
end
