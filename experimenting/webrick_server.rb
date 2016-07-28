require 'webrick'

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
	def do_GET(request, response)
		response.status = 200
		response.content_type = 'text/plain'
		response.body = "Hello, World! You are trying to load #{request.path}."
	end


end


server = WEBrick::HTTPServer.new( :Port => 4200 )
server.mount "/", MyServlet
trap("INT"){ server.shutdown } #shuts down the server when ctr + c
server.start