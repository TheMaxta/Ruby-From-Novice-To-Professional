## Side project, trying to understand how to manipulate the terminal window
 # with ruby scripting

 require 'highline'

 tSize = HighLine::SystemExtensions.terminal_size 			# [ columns, lines ]

 print tSize
 puts "\n\n"
 puts "width : #{tSize[0]}"
 puts "height: #{tSize[1]}"
 # display terminal size to terminal. Not super-duper userful, LOL.