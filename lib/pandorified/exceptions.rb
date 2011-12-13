module Pandorified
	module Exceptions
		# Raised when Pandorabots returns an API result with a non-zero status.
		class PandorabotsError < StandardError
		end
	end
end
