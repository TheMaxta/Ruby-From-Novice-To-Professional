=begin

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
=end

require 'fileutils'


Dir.mkdir('Site')
Dir.mkdir('Site/assets')
Dir.mkdir('Site/assets/images')
Dir.mkdir('Site/assets/bootstrap')


Dir.mkdir('Site/assets/javascript')
Dir.mkdir('Site/assets/stylesheets')






index = File.new('./Site/index.html','w')
index.write "

<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href='assets/bootstrap/css/bootstrap.min.css' rel='stylesheet'>
    <link href='assets/stylesheets/theme.css' rel='stylesheet'>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src='https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js'></script>
      <script src='https://oss.maxcdn.com/respond/1.4.2/respond.min.js'></script>
    <![endif]-->
  </head>
  <body>
  <div class='banner'>
      <h1>Hello, world! This Whole Site was made 1 second ago :)</h1>
  </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src='assets/bootstrap/js/bootstrap.min.js'></script>
  </body>
</html>'


"

error = File.new('./Site/404.html', 'w')

theme = File.new('./Site/assets/stylesheets/theme.css', 'w')


FileUtils.cp_r 'bs/.', 'Site/assets/bootstrap'

