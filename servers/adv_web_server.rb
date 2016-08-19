=begin



		THIS SCRIPT RUNS AN HTTP SERVER. WHEN USING SERVER REFER TO URL: LOCALHOST:4200/add?a=1*b=2
		this url will pass a, and b to the webrick server. Which will then call our NormalClass with 
		the appropriate method and return the evaluation to the web-page.




=end
	
	
end


require 'webrick'

class MyNormalClass

	def MyNormalClass.add(a,b)
		a.to_i + b.to_i
	end

	def MyNormalClass.subtract(a,b)
		a.to_i - b.to_i
	end

	def MyNormalClass.multiply(a,b)
		a.to_i * b.to_i
	end

	def MyNormalClass.divide(a,b)
		a.to_i / b.to_i
	end

end


class MyServlet < WEBrick::HTTPServlet::AbstractServlet
	def do_GET(request, response)
		if request.query['a'] && request.query['b']
			a = request.query['a']
			b = request.query['b']
			response.status = 200
			response.content_type = 'text/plain'
			result = nil

			case request.path 

				when '/add'
					result = MyNormalClass.add(a,b)

				when '/subtract'
					result = MyNormalClass.subtract(a,b)

				when '/multiply'
					result = MyNormalClass.multiply(a,b)

				when '/divide'
					result = MyNormalClass.divide(a,b)

				else
					result = "No Such Method! Idiot!!"

			end

	response.body = result.to_s + "\n\n"	

		else
			response.status = 400
			response.body = "You did not provide the correct parameters!"

		end ## end if/else


	end ##end method do_GET

end


server = WEBrick::HTTPServer.new( :Port => 4200 )
server.mount '/', MyServlet # mount method calls our servlet class, which parses http data'ssss
trap('INT'){ server.shutdown }
server.start