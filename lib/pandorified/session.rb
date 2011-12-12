require 'pandorified/result'

module Pandorified
	class Session
		def initialize(botid, custid = nil)
			@botid = botid
			@custid = custid
		end

		def talk(input)
			result = Pandorified::Result.new(botid: @botid, custid: @custid, input: input)
			if result.status.zero?
				@custid ||= result.custid
				result.that
			else
				raise "Pandorabots returned status #{result.status}: #{result.message}"
			end
		end
	end
end
