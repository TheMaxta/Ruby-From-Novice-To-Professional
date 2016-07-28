#most basic ruby cgi script

#!/usr/bin/ruby

puts "Content-type: text/html\n\n"
puts "<html><body>This is a test</body></html>"








### more complex uses of cgi scripting: ###

require 'cgi'

cgi = CGI.new

puts cgi.header

puts "<html><body>This is a test</body></html>"










#accepting cgi variables....


  #we could use this to access html input tag's that 'post' cgi_test.cgi

  cgi = CGI.new


  #refers to html element with a name of 'text'
  text = cgi['text']

  puts cgi.header

  puts "<html><body>#{text.reverse}</body></html>"






#more complete example

	cgi = CGI.new


	from = cgi['from'].to_i
	to = cgi['to'].to_i

	number = rand( to - from + 1 ) + from

	puts cgi.header
	puts "<html><body>#{number}</body></html>"


