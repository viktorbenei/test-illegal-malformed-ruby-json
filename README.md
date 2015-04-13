# test-illegal-malformed-ruby-json

Ruby `source sequence is illegal/malformed utf-8` issue reproduction.

## How to run

1. Set the json gem version in Gemfile.
2. run: `$ bundle install` to get the json version.
3. run: `$ bundle exec ruby json_test.rb` to run the test.

With `1.7.7` it succeeds (prints *=> This version worked!*),
but with version `1.8.x` of the json ruby gem an exception is
generated:

	[!] Failed to GENERATE JSON: source sequence is illegal/malformed utf-8
	[!] line: [line] : .��ProductV

	[!] orig_line: [line] : .��ProductV

	json_test.rb:20:in `rescue in block in <main>': This version failed! (RuntimeError)
		from json_test.rb:8:in `block in <main>'
		from json_test.rb:4:in `each'
		from json_test.rb:4:in `<main>'

