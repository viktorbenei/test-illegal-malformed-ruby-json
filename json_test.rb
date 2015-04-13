require 'json'

file = File.open("sample-log.txt", "r")
file.each {|line|
	orig_line = line.dup
	line = line.to_s.force_encoding("UTF-8").encode("UTF-8")

	begin
		test_hsh = {cont: line}
		JSON.generate(test_hsh)
	rescue => ex
		# this should never happen as we called specifically
		#  called the Ruby encode methods, which should generate a valid UTF-8 string!
		puts
		puts " [!] Failed to GENERATE JSON: #{ex}"
		puts " [!] line: #{line}"
		puts
		puts " [!] orig_line: #{orig_line}"
		puts
	end
}