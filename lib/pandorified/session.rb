require 'pandorified/result'
require 'pandorified/exceptions'

module Pandorified
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
		# If Pandorabots responds with an error, {Pandorified::Exceptions::PandorabotsError} is raised.
		#
		# @param [String] input Text to say to the bot.
		#
		# @return [String] The bot's response text.
		def talk(input)
			result = Pandorified::Result.new(botid: @botid, custid: @custid, input: input)
			if result.success?
				@custid ||= result.custid
				result.that
			else
				raise Pandorified::Exceptions::PandorabotsError, "Pandorabots returned status #{result.status}: #{result.message}"
			end
		end
	end
end
