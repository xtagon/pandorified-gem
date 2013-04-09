Summary
-------

Pandorified is a simple Ruby wrapper for the Pandorabots API. Talk to chat bots in your Ruby scripts!

Installation
------------

	gem install pandorified

Or add Pandorified to your project's Gemfile:

	gem 'pandorified'

Getting Started
---------------

To interact with the Pandorabots, you need to know the BOTID of the bot you wish to talk to. If you have published your own bot, the BOTID will be listed on your Botmaster page.

Here is a basic example:

	require 'pandorified'
	
	CHOMSKY_BOTID = 'b0dafd24ee35a477'
	
	# Send a message to Chomsky and print the response
	puts Pandorified.talk!("Hello, Bot!", CHOMSKY_BOTID)

If you want the bot to remember who you are, you can create a session object and re-use it.

	bot = Pandorified::Session.new('b0dafd24ee35a477')
	puts bot.talk!("Hello")
	puts bot.talk!("Goodbye now!")

Full documentation is available [here](http://rubydoc.info/gems/pandorified/frames). If anything in the documentation is not clear, please [report it as a bug][1].

Contributing
------------

If you've found a bug or have a feature suggestion, let me know on the [issue tracker][1] or [send me an e-mail][2]. I welcome all feedback, and I'd love to hear about what cool things you've made with this!

Author
------

[Justin Workman][2]

License
-------

Copyright © 2011-2013 Justin Workman

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[1]: https://bitbucket.org/xtagon/pandorified/issues?status=new&status=open
[2]: mailto:xtagon@gmail.com
