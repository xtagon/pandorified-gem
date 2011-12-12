Summary
-------

Pandorified makes it easy for your Ruby scripts to interact with chat bots hosted on Pandorabots.

Installation
------------

	gem install pandorified

Getting Started
---------------

The easiest way to get started is by using the `Pandorified::Session` class:

	require 'pandorified'
	
	my_bot_session = Pandorified::Session.new(MY_BOTID)
	first_response = my_bot_session.talk('Hello World!')
	puts(first_response)

In the example above, replace `MY_BOTID` with the actual botid of the Pandorabots chat bot you want to talk to.

Documentation
-------------

Documentation is available [here](http://rubydoc.info/github/xtagon/pandorified/).

Author
------

[Justin Workman](mailto:xtagon@gmail.com)

License
-------

Copyright (c) 2011 Justin Workman

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
