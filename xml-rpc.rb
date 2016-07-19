## testing / messing around with XML-RPC....




=begin



require 'xmlrpc/client'

server = XMLRPC::Client.new2("http://www.rubyinside.com/book/xmlrpctest.cgi")

puts server.call("sample.sumAndDifference", 5, 3).inspect



=end




#making and xml-rpc enabled program

require 'xmlrpc/server'

	server = XMLRPC::Server.new(1200)

	server.add_handler("sample.sumAndDifference") do |a,b|

		{ "sum" => a.to_i + b.to_i, 
		  "difference" => a.to_i - b.to_i }

	end


trap('INT'){server.shutdown}

server.serve
