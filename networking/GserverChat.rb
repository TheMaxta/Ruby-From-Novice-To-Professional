require 'gserver'
require_relative 'wordplay'
#ruby generic server handles multi threading, and makes connections


class HelloServer < GServer 
	def serve(io)
		loop do
			io.puts("Say something to me:")
			line = io.gets
			line_swap = WordPlay.switch_pronouns(line)
			io.puts("You said '#{line.chomp}.'")
			io.puts("The Server says, '#{line_swap}...'")
			puts "\n"
		end
	end
end
server = HelloServer.new(1234, '127.0.0.1', 1)
server.start
server.join