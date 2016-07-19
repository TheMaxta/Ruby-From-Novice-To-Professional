class StaticPage

	def head


		#title
		#meta
		#meta

		#fonts

	end



	def logo
		#assets/images/logo.png

	end

	def herounit

		#6 words or less title
		#assets/images/banner.jpg
	end


	def slide1
		#assets/images/slide1

	end
	def slide2	
		#assets/images/slide2

	end

	def slide3	
		#assets/images/slide3

	end

	def slide4	
		#assets/images/slide4


	end


	def footer

	end



end




creating files...
require 'fileutils'


class Files



end



Dir.mkdir('assets')
Dir.mkdir('assets/images')
Dir.mkdir('assets/bootstrap')

Dir.mkdir('assets/bootstrap/css')
Dir.mkdir('assets/bootstrap/fonts')
Dir.mkdir('assets/bootstrap/js')


Dir.mkdir('assets/javascript')
Dir.mkdir('assets/stylesheets')



index = File.new('./index.txt','w')

theme = File.new('./assets/stylesheets/theme.txt', 'w')


