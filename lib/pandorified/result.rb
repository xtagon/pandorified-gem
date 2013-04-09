require 'rest_client'
require 'nokogiri'

module Pandorified
	API_URL = 'http://www.pandorabots.com/pandora/talk-xml'

	class Result
		def initialize(params)
			@xml = Nokogiri::XML(RestClient.post(API_URL, params))
		end

		# @return [String] The bot's response to the input.
		def that
			@that ||= @xml.xpath('/result/that').first.text
		end

		alias_method :to_s, :that

		# Check the status of this result. See {#success?} and {#error?}.
		#
		# @return [Number] A status number as returned by Pandorabots.
		def status
			@status ||= @xml.xpath('/result/@status').first.value.to_i
		end

		# @return `true` if this result was successful (no error was returned by Pandorabots), `false` otherwise.
		def success?
			self.status.zero?
		end

		alias_method :ok?, :success?
		alias_method :successful?, :success?

		# @note After checking if there is an error, you can read the error message with {#message}.
		#
		# @return `true` if Pandorabots returned an error.
		def error?
			!self.success?
		end

		# @return [String] The error message as returned by Pandorabots, if an error occured.
		def message
			return nil if self.success?
			@message ||= @xml.xpath('/result/message').first.text
		end

		alias_method :error, :message
		alias_method :error_message, :message

		# @return [String] The botid of the bot this result is for.
		def botid
			@botid ||= @xml.xpath('/result/@botid').first.value
		end

		# @return [String] The custid for this session.
		def custid
			@custid ||= @xml.xpath('/result/@custid').first.value
		end

		# @return [String] The orginal input that triggered this response.
		def input
			@input ||= @xml.xpath('/result/input').first.text
		end
	end
end
