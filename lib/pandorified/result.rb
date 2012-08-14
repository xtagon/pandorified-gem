require 'rest_client'
require 'nokogiri'

module Pandorified
	API_URL = 'http://www.pandorabots.com/pandora/talk-xml'

	class Result
		def initialize(params)
			@xml = Nokogiri::XML(RestClient.post(API_URL, params))
		end

		def status
			@status ||= @xml.xpath('/result/@status').first.value.to_i
		end

		def botid
			@botid ||= @xml.xpath('/result/@botid').first.value
		end

		def custid
			@custid ||= @xml.xpath('/result/@custid').first.value
		end

		def input
			@input ||= @xml.xpath('/result/input').first.text
		end

		def that
			@that ||= @xml.xpath('/result/that').first.text
		end

		def message
			@message ||= @xml.xpath('/result/message').first.text
		end

		def success?
			self.status.zero?
		end

		alias_method :ok?, :success?
		alias_method :successful?, :success?

		def error?
			!self.success?
		end
	end
end
