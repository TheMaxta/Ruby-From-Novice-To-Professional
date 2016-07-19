## creating a basic web/http server

require 'webrick'

server = WEBrick::GenericServer.new( :Port => 1234 ) 
						## access server through localhost and port :1234



trap("INT"){ server.shutdown }


server.start do |socket|
	socket.puts Time.now
end

