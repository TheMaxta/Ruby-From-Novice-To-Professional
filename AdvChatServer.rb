require 'gserver'

class ChatServer < GServer
	def initialize(*args)
		super(*args)
		## Keep an overall record of the client IDs allocated and the lines of chat..
		@@client_id = 0
		@@chat = []
	end

	def serve(io)
		# Increment the client ID so each new client gets a unique ID..
		@@client_id += 1
		my_client_id = ''
		my_position = @@chat.size
		io.puts("Welcome to the chat room!! Please Give Enter Your Nick Name: "
		my_client_id = io.gets

		# Leave a message on the chat queue to signify this client has joined the discussion
		@@chat << [my_client_id, " <Has Joined the Chat>"]


		loop do
			## Check for new data every 5 seconds... 
			if IO.select([io], nil, nil, 2)
				# if so, receive that data, and process it accordingly.
				line = io.gets

				if line =~ /quit/
					@@chat << [my_client_id, " <Has Left the Chat>"]
					break
				end

			# Shutdown the server if we hear 'shutdown' command.
			self.stop if line =~ /shutdown/

			## Add the client's text to the chat array allong with it's client ID...
			@@chat << [my_client_id, line]
			else
				# No data, so print any new lines from the chat stream
				@@chat[my_position..(@@chat.size-1)].each_with_index do |line, index|
					io.puts("#{line[0]} says: #{line[1]}")
				end #end do with index

				# Move the position to one past the end of the array
				my_position = @@chat.size

			end #end if new data
		end #end of loop do
	end #end of serv method
end #end chat server class

server = ChatServer.new(1234, '127.0.0.1', 10) #run on port 1234
server.start

loop do 
	break if server.stopped?
end