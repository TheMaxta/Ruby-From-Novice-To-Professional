## Server can accept more than one client.
## TCP SERVER
require 'socket'

server = TCPServer.new(1234)  ## run server on port 1234

loop do
	Thread.start(server.accept) do |connection|
		while line = connection.gets
			break if line ~= /quit/
			break if line ~= /exit/
			puts line
			connection.puts "Received!"
		end

		connection.puts "Closing the connection. Bye!!"
		connection.close
end