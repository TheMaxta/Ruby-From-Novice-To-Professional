require 'gserver'
require_relative 'wordplay'
#ruby generic server handles multi threading, and makes connections


class HelloServer < GServer 
	def serve(io)
		puts "To exit this server, type 'shutdown' through a client..."
		io.puts("To exit Server, Type 'shutdown' as a response....")
		loop do
			io.puts("Say something to me:")
			line = io.gets
			self.stop if line =~ /shutdown/
			line_swap = WordPlay.switch_pronouns(line)
			io.puts("You said '#{line.chomp}.'")
			io.puts("The Server says, '#{line_swap}...'")
			puts "\n"
		end
	end
end
server = HelloServer.new(1234, '127.0.0.1', 1)
server.start

loop do
	break if server.stopped?
end

puts "Server has been terminated"