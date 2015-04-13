# test-illegal-malformed-ruby-json

Ruby `source sequence is illegal/malformed utf-8` issue reproduction.

## How to run

1. Set the json gem version in Gemfile.
2. run: `$ bundle install && bundle exec ruby json_test.rb`

With `1.7.7` it succeeds (prints `=> This version worked!`),
but with version `1.8.x` of the json ruby gem an exception is
generated:

	[!] Failed to GENERATE JSON: source sequence is illegal/malformed utf-8
	[!] line: [line] : .��ProductV

	[!] orig_line: [line] : .��ProductV

	json_test.rb:20:in `rescue in block in <main>': This version failed! (RuntimeError)
		from json_test.rb:8:in `block in <main>'
		from json_test.rb:4:in `each'
		from json_test.rb:4:in `<main>'

## Notes

* Tested with:
  * base ruby on OS X: `ruby 2.0.0p481 (2014-05-08 revision 45883) [universal.x86_64-darwin14]`
  * RVM on OS X: `ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-darwin14.0]`
  * RVM on Ubuntu: `ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-linux]`
* actually the line `line = line.to_s.force_encoding("UTF-8").encode("UTF-8")` is not even required for the included sample-log.txt