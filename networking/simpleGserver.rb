require 'gserver'
#Gserver or generic server gem, automatically implements all threading and connections management necessary :)
#So we have written a multi-threaded Tcp server that outputs a message to any client 
#   over telnet or url, in only about 10 lines of code! :D


class HelloServer < GServer ##CLASS INHERITS GSERVER ATTRIBUTES
	def serve(io)
		io.puts("Hello! Welcome to the GENERIC SERVER")
	end
end
server = HelloServer.new(1234)
server.start
server.join