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



 y = "

 body {
    font-family: 'Poppins', sans-serif;
    font-weight: 300;
    text-rendering: optimizeLegibility;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}


.hero-unit {
	height: 800px;
	background-color: #737373;
	background-image: url('../images/banner.jpg');
	width: 100%;
	text-align: center;
	color: white;	
	background-size: cover;
    background-repeat: no-repeat;

    
}

.logo {
	position: absolute;
    left: 50%;
    top: 45%;
}

.hero-subtitle {
    margin-top: 10px;
    padding-top: 10px;
    padding-bottom:10px;
    left: 0;
    width: 100%;
    position: absolute;
    top: 55%;
    font-family: 'Open Sans';
    color: #fff;
    font-size: 35px;
    font-weight: 300;
    letter-spacing: 7px;
    text-align: center;
    text-transform: uppercase;
	background: rgba(0, 0, 0, 0.6);
}



.panel1 {
	width: 100%;
	text-align: center;
	background-color: white;
	height: 600px;
}
.sub-panel1 {
	background-color: #4DADFE;
	padding: 55px 0;
	width: 100%;
}
.panel-text {
    margin: 220px 75px 165px 75px;
    text-align: center;
    font-size: 30px;
    padding-bottom: 100px;
}

.panel2 {
	width: 100%;
	text-align: center;
	background-color: #717070;
	height: 550px;

}
.sub-panel2 {

}

.panel3 {
	width: 100%;
	text-align: center;
	background-color: #4DADFE;
	height: 550px;
}


.panel4 {
	width: 100%;
	text-align: center;
	background-color: white;
	height: 550px;

}

.panel5 {
	width: 100%;
	background-color: white;
	height: 550px;
	position: relative;
}
#panel-img {
	height: 700px;
	width: 100%;
	background-size: cover;
    background-repeat: no-repeat;
    position: relative;
}
.sub-panel5 {
	background-color: #F14400;
	padding: 55px 0;
	width: 100%;
	height: 200px;
}

.sub-panel52 {
	background-color: #F14400;
	padding: 55px 0;
	width: 100%;
	height: 200px;
}

.panel6 {
	width: 100%;
	background-color: white;
	height: 500px;
}

.container-fluid {
	padding-left: 0px;
	padding-right: 0px;
}







 "

 x = "

<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Auto Generated Title</title>

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
  <div class='container-fluid'>
    <div class='hero-unit'>
      <div class='logo'>
        
      </div>
      <div class='hero-subtitle'>
          Making the world a better place
      
      </div>
    </div>
    <div class='panel1'>
      <div class='sub-panel1'></div>
        <p class='panel-text'>We're more than the chat, mail, search and phone that's
        crowned Hooli as the most respected brand in the world.</p>


    </div>
    <div class='panel2'>

      
      


    </div>
    <div class='panel3'>
      


      
    </div>
    <div class='panel4'>
      
      


    </div>
    <div class='panel5'>
      <div class='sub-panel5'></div>
        <img id='panel-img' src='assets/images/beach.jpg'>

      <div class='sub-panel52'>
      </div>
    </div>

  </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src='assets/bootstrap/js/bootstrap.min.js'></script>
  </body>
</html>

"

Dir.mkdir('Site')
Dir.mkdir('Site/assets')
Dir.mkdir('Site/assets/images')
Dir.mkdir('Site/assets/bootstrap')


Dir.mkdir('Site/assets/javascript')
Dir.mkdir('Site/assets/stylesheets')







index = File.new('./Site/index.html','w')
index.write x

error = File.new('./Site/404.html', 'w')

theme = File.new('./Site/assets/stylesheets/theme.css', 'w')
theme.write y

FileUtils.cp_r 'bs/.', 'Site/assets/bootstrap'
FileUtils.cp_r 'options/.','Site/assets/images'

