require 'pandorified/version'
require 'pandorified/result'
require 'pandorified/session'

module Pandorified
	# Send a message to a bot and receive a response.
	#
	# See {Pandorified::Result} for ways to handle the response, or use {.talk!} which raises an exception on errors.
	# If you want to remember the {botid} and {custid} between multiple calls, you should use {Pandorabots::Session} instead of this method.
	#
	# @param [String] input Text to say to the bot.
	# @param [String] botid A valid Pandorabots botid.
	# @param [String] custid An itentifier used to keep track of this conversaion.
	#
	# @return [Pandorified::Result] The bot's response as a result object.
	def self.talk(input, botid, custid = nil)
		Pandorified::Session.new(botid, custid).talk(input)
	end

	# Send a message to a bot and receive a response (if successsful).
	#
	# If Pandorabots respondes with an error, {Pandorified::PandorabotsError} is raised.
	# If you'd rather check for and handle the error yourself, use {.talk} instead of this method.
	#
	# If you want to remember the {botid} and {custid} between multiple calls, you should use {Pandorabots::Session} instead of this method.
	#
	# @param [String] input Text to say to the bot.
	# @param [String] botid A valid Pandorabots botid.
	# @param [String] custid An itentifier used to keep track of this conversaion.
	#
	# @return [String] The bot's response text.
	def self.talk!(input, botid, custid = nil)
		Pandorified::Session.new(botid, custid).talk!(input).to_s
	end
end
