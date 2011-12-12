require 'rest_client'
require 'nokogiri'

module Pandorified
	API_URL = 'http://www.pandorabots.com/pandora/talk-xml'

	class Result
		def initialize(params)
			@xml = Nokogiri::XML(RestClient.post(API_URL, params))
		end

		def status
			@xml.xpath('/result/@status').first.value.to_i
		end

		def botid
			@xml.xpath('/result/@botid').first.value
		end

		def custid
			@xml.xpath('/result/@custid').first.value
		end

		def input
			@xml.xpath('/result/input').first.text
		end

		def that
			@xml.xpath('/result/that').first.text
		end

		def message
			@xml.xpath('/result/message').first.text
		end
	end
end
