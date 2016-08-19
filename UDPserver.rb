require 'socket'
#runs server, until 5 messages are received from the client...


s = UDPSocket.new
s.bind(nil, 1234)
5.times do 
	text, sender = s.recvfrom(16)
	puts text
end