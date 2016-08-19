require 'socket'
## COMMUNICATE WITH SERVER VIA COMMANDLINE
# EXAMPLE:  telnet 127.0.0.1 1234
# then, type a message, and you will receive a received! message...





server = TCPServer.new(1234)

while connection = server.accept
	while line = connection.gets
		break if line =~ /quit/
		puts line 
		connection.puts "Received!"
	end

	connection.puts "Closing the connection. Bye!!"
	connection.close
end